import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@singleton
class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  bool isPopupShown = false;

  NavigatorState get _navigator => _navigatorKey.currentState!;

  Future<dynamic> navigateTo(String routeName) {
    return _navigator.pushNamed(routeName);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, RoutePredicate predicate) {
    return _navigator.pushNamedAndRemoveUntil(routeName, predicate);
  }

  Future<dynamic> pushNamedAndRemoveUntilWithArgument<T>(String routeName, RoutePredicate predicate, T data) {
    return _navigator.pushNamedAndRemoveUntil(routeName, predicate, arguments: data);
  }

  Future<dynamic> pushReplacementNamed<T>(String routeName, {T? data}) {
    return _navigator.pushReplacementNamed(routeName, arguments: data);
  }

  Future<dynamic> popAndPushNamed(String routeName) {
    return _navigator.popAndPushNamed(routeName);
  }

  Future<dynamic> popAndPushNamedWithArgument<T>(String routeName, {dynamic result, T? data}) {
    return _navigator.popAndPushNamed(routeName, result: result, arguments: data);
  }

  Future<dynamic> popAndNavigateTo(String routeName) {
    return _navigator.popAndPushNamed(routeName);
  }

  Future<dynamic> navigateToWithArgument<T>(String routeName, T data) {
    return _navigator.pushNamed(routeName, arguments: data);
  }

  void pop<T>([T? result]) {
    return _navigator.pop(result);
  }

  Widget? getCurrentWidget() {
    return _navigatorKey.currentWidget;
  }

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
