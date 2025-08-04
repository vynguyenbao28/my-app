import 'package:app/core/response_result.dart';
import 'package:app/data/network_exception.dart';

mixin MethodApi {
  Future<ResponseResult<T>> callApi<T>({
    T? defaultData,
    required Future<dynamic> Function() api,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await api();
      // case 204 - no content
      if (response is String && response.isEmpty && defaultData != null) {
        return ResponseResult.success(data: defaultData);
      }
      final T result = fromJson?.call(response) ?? response;
      return ResponseResult.success(data: result);
    } on NetworkException catch (e) {
      return ResponseResult.error(exception: e.message ?? '', code: e.statusCode);
    } catch (e) {
      return ResponseResult.error(exception: e.toString());
    }
  }

  Future<ResponseResult<List<T>>> callApiListResponse<T>(
      {required Future<dynamic> Function() api, required T Function(dynamic) fromJson}) async {
    try {
      final response = await api();
      final result = (response as List<dynamic>).map((e) => fromJson(e)).toList();
      return ResponseResult.success(data: result);
    } on NetworkException catch (e) {
      return ResponseResult.error(exception: e.message ?? '', code: e.statusCode);
    } catch (e) {
      return ResponseResult.error(exception: e.toString());
    }
  }
}
