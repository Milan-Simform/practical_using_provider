import 'package:flutter/material.dart';
import 'package:practical_using_provider/modules/user/screens/add_edit_user.dart';
import 'package:practical_using_provider/modules/user/screens/all_users.dart';

class Routes {
  static const String defaultScreen = '/';
  static const String addEditUserScreen = '/addEditUserScreen';
}

class NavigationService {
  factory NavigationService() => _instance;

  NavigationService._internal();

  static final NavigationService _instance = NavigationService._internal();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.defaultScreen:
        return MaterialPageRoute(builder: (context) => const AllUsersScreen());
      case Routes.addEditUserScreen:
        if (settings.arguments is AddEditUserScreenArguments) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const AddEditUserScreen(),
          );
        }
        return _errorRoute();
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
