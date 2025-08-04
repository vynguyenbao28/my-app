import 'package:app/data/app_configure/app_configure.dart';
import 'package:app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfigure.initialize(AppConfigureEnv.prod);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
