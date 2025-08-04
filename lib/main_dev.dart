import 'package:app/data/app_configure/app_configure.dart';
import 'package:app/di/injection.dart';
import 'package:app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await AppConfigure.initialize(AppConfigureEnv.dev);
  runApp(const MyApp());
}
