import 'package:app/features/home/home_page.dart';
import 'package:app/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

part '_transition.dart';

class RoutesGenerator {
  static Route generateRoute(RouteSettings settings) {
    _GeneratePageRoute route({required Widget child}) {
      return _GeneratePageRoute(child: child, settings: settings);
    }

    switch (settings.name) {
      case HomePage.routeName:
        return route(child: const HomePage());
      case LoginPage.routeName:
        return route(child: const LoginPage());
    }
    return route(
      child: const Scaffold(
        body: Center(
          child: Text('Chức năng đang trong quá trình phát triển ...'),
        ),
      ),
    );
  }

  static List<SingleChildWidget> get multiProviderList => [
        ///Các bloc global
      ];
}
