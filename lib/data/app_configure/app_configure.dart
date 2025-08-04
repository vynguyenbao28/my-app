import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfigure {
  static Map<String, dynamic> _config = {};

  static Future<void> initialize(AppConfigureEnv env) async {
    final configString = await rootBundle.loadString('environment/environment_${env.name}.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String get getEndpoint {
    return _config['endpoint'] as String;
  }

  static AppConfigureEnv get getAppConfigureEnv {
    switch (_config['env']) {
      case 'dev':
        return AppConfigureEnv.dev;
      case 'prod':
        return AppConfigureEnv.prod;
    }
    throw Exception('Unknown enviroment');
  }

  static bool get isDev => getAppConfigureEnv != AppConfigureEnv.prod;
}

enum AppConfigureEnv { dev, prod }
