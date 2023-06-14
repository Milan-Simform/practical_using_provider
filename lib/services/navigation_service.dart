import 'package:flutter/material.dart';

class Routes {
  static const String addUserScreen = 'addUserScreen';
  static const String editUserScreen = 'editUserScreen';
}

class NavigationService {
  factory NavigationService() => _instance;

  NavigationService._internal();

  static final NavigationService _instance = NavigationService._internal();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.addUserScreen:
      default:
        return _errorRoute();
    }
  }
}

MaterialPageRoute<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return const Scaffold(
        body: Center(child: Text('Error')),
      );
    },
  );
}
