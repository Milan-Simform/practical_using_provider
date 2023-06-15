import 'package:flutter/material.dart';
import 'package:practical_using_provider/services/navigation_service.dart';

extension MyNavigation on BuildContext {
  Future<T?> toNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return NavigationService()
        .navigatorKey
        .currentState!
        .pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> to<T extends Object?>(Route<T> route) {
    return NavigationService().navigatorKey.currentState!.push(route);
  }

  void pop<T extends Object?>([T? result]) =>
      NavigationService().navigatorKey.currentState!.pop(result);
}

extension EmailValidator on String {
  bool get isEmail {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
