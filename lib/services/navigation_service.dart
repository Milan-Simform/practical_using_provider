import 'package:flutter/material.dart';
import 'package:practical_using_provider/modules/user/screens/add_user.dart';
import 'package:practical_using_provider/modules/user/screens/all_users.dart';
import 'package:practical_using_provider/modules/user/screens/edit_user.dart';

class Routes {
  static const String defaultScreen = '/';
  static const String addUserScreen = '/addUserScreen';
  static const String editUserScreen = '/editUserScreen';
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
      case Routes.addUserScreen:
        if (settings.arguments is AddUserScreenArguments) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const AddUserScreen(),
          );
        }
        return _errorRoute();

      case Routes.editUserScreen:
        if (settings.arguments is EditUserScreenArguments) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const EditUserScreen(),
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
