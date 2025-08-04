import 'package:flutter/material.dart';

final MyRouteObserver<PageRoute> routeObserver = MyRouteObserver<PageRoute>();

class MyRouteObserver<T extends Route<dynamic>> extends RouteObserver<T> {
  void _sendScreenView(PageRoute route) {
    var screenName = route.settings.name;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }
}
