// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:app/data/app_configure/app_configure.dart';
import 'package:app/utils/extensions/date_time_ext.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (AppConfigure.isDev) {
      _renderCurlRepresentation(err.requestOptions);
    }

    return handler.next(err); //continue
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (AppConfigure.isDev) {
      _renderCurlRepresentation(response.requestOptions);
    }
    return handler.next(response); //continue
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    // add a breakpoint here so all errors can break
    try {
      final curl = _cURLRepresentation(requestOptions);
      log(curl);
      saveFile(curl);
    } catch (err) {
      log('unable to create a CURL representation of the requestOptions');
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    List<String> components = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      // FormData can't be JSON-serialized, so keep only their fields attributes
      if (options.data is FormData) {
        options.data = Map.fromEntries(options.data.fields);
      }

      final data = json.encode(options.data).replaceAll('"', '\\"');
      components.add('-d "$data"');
    }

    components.add('"${options.uri.toString()}"');

    return components.join(' \\\n\t');
  }

  Future<void> saveFile(String content) async {
    const String fileName = 'curl.txt';
    try {
      // Request permissions
      if (await _requestPermission(Permission.storage)) {
        // Get application documents directory
        final directory = await getApplicationDocumentsDirectory();
        final path = directory.path;

        // Create file object with specific path
        final file = File('$path/$fileName');

        // Read existing content of the file (if any)
        final String line = List.generate(100, (_) => '-').join('');
        String existingContent = '';
        if (await file.exists()) {
          existingContent = await file.readAsString();
        }

        // Append new content to the file
        await file.writeAsString(
          '${DateTime.now().format('dd/MM/yyyy hh:mm')}$line\n$content\n$line$existingContent',
          mode: FileMode.writeOnlyAppend,
        );
        print('Appended to file at $path/$fileName');
      } else {
        print('Permission denied');
      }
    } catch (e) {
      print('Error saving file: $e');
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      final result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }
}
