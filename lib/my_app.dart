import 'package:app/constants/prefs.dart';
import 'package:app/data/cache/cache.dart';
import 'package:app/di/injection.dart';
import 'package:app/features/home/home_page.dart';
import 'package:app/features/login/login_page.dart';
import 'package:app/navigation_service.dart';
import 'package:app/route_observer.dart';
import 'package:app/routes/routes_generator.dart';
import 'package:app/widgets/dio_listener.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String? token = injector<CacheApp>().getString(Preferences.token);
    return MaterialApp(
      title: 'MyApp',
      navigatorKey: injector<NavigationService>().navigatorKey,
      builder: (_, child) => DioListener(child: child!),
      navigatorObservers: [routeObserver],
      onGenerateRoute: RoutesGenerator.generateRoute,
      initialRoute: token == null ? LoginPage.routeName : '',
    );
  }
}
