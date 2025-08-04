import 'dart:io';

import 'package:app/data/app_configure/app_configure.dart';
import 'package:app/data/dio/dio_bloc.dart';
import 'package:app/data/end_point.dart';
import 'package:app/data/interceptor.dart';
import 'package:app/domain/repository/preference/preference_repository.dart';
import 'package:app/navigation_service.dart';
import 'package:app/utils/dialogs.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class BaseDio {
  final NavigationService _navigationService;
  final PreferenceRepository _preferenceRepository;
  final LoggingInterceptor _loggingInterceptor;
  final DialogApp _dialogApp;

  BaseDio(this._navigationService, this._preferenceRepository, this._loggingInterceptor, this._dialogApp);

  static const Duration _connectTimeout = Duration(milliseconds: 30000);
  static const Duration _receiveTimeout = Duration(milliseconds: 90000);
  static const Duration _sendTimeout = Duration(milliseconds: 30000);
  static const Duration _timeTimeout = Duration(milliseconds: 30000);
  late final Map<String, dynamic> _headers = _preferenceRepository.getHeader();

  Future<Response?> _common({
    required String url,
    required Future<Response> fetch,
  }) async {
    try {
      final DioBloc? dioBloc = _navigationService.navigatorKey.currentContext?.read<DioBloc>();
      dioBloc?.initial();
      if (await _checkInternet() == false) {
        dioBloc?.noInternet();
        return null;
      }
      final result = await fetch.timeout(_timeTimeout);
      if (result.statusCode == 401 || result.statusCode == 405) {
        dioBloc?.expired();
      }
      if ((result.statusCode ?? 500) >= 300) {
        dioBloc?.error(result.statusMessage ?? 'Vui lòng kiểm tra lại');
      }
      return result;
    } catch (_) {
      rethrow;
    } finally {
      _dialogApp.stopLoading();
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    return await _common(
      url: _getUrl(url),
      fetch: _dio.post(
        _getUrl(url),
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType ?? Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: _headers,
        ),
      ),
    );
  }

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    return await _common(
      url: _getUrl(url),
      fetch: _dio.put(
        _getUrl(url),
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType ?? Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: _headers,
        ),
      ),
    );
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    return await _common(
      url: _getUrl(url),
      fetch: _dio.get(
        _getUrl(url),
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType ?? Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: _headers,
        ),
      ),
    );
  }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    return await _common(
      url: _getUrl(url),
      fetch: _dio.delete(
        _getUrl(url),
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType ?? Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: _headers,
        ),
      ),
    );
  }

  String _getUrl(String url) {
    return '${AppConfigure.getEndpoint}$url';
  }

  Future<bool> _checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com').timeout(_sendTimeout, onTimeout: () {
        return [];
      });
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  Interceptors get _interceptors {
    final interceptors = Interceptors();
    interceptors.add(_loggingInterceptor);
    interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      request: true,
      maxWidth: 90,
    ));
    return interceptors;
  }

  Dio getBaseDio(String baseUrl) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
    ));
    dio.interceptors.addAll(_interceptors);
    dio.httpClientAdapter = _ioHttpClientAdapter;
    return dio;
  }

  IOHttpClientAdapter get _ioHttpClientAdapter {
    return IOHttpClientAdapter(createHttpClient: () {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return httpClient;
    });
  }

  @lazySingleton
  Dio get _dio {
    return getBaseDio(Endpoint.baseUrl);
  }
}
