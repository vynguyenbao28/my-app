import 'dart:async';

import 'package:app/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class DialogApp {
  final NavigationService _navigationService;

  DialogApp(this._navigationService);

  final Duration _timeOut = const Duration(seconds: 3);

  bool _isLoading = false;

  Future<void> startLoading() async {
    final BuildContext? context = _navigationService.navigatorKey.currentContext;
    if (context == null || _isLoading) return;
    _isLoading = true;
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.2),
      builder: (_) {
        return const PopScope(
          canPop: false,
          child: SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[Center(child: CircularProgressIndicator())],
          ),
        );
      },
    ).timeout(_timeOut, onTimeout: stopLoading).whenComplete(() => stopLoading());
  }

  void stopLoading() async {
    if (_isLoading) {
      _isLoading = false;
      _navigationService.pop();
    }
  }
}

class Delay {
  final int milliseconds;

  Delay({this.milliseconds = 500});

  static Timer? _timer;

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
