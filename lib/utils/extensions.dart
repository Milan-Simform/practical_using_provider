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
        .pushNamed(routeName, arguments: arguments);
  }

  Future<T?> to<T extends Object?>(Route<T> route) {
    return NavigationService().navigatorKey.currentState!.push(route);
  }
}
