import 'package:flutter/material.dart';
import 'package:practical_using_provider/services/navigation_service.dart';
import 'package:practical_using_provider/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practical using Provider',
      theme: AppTheme.lightTheme,
      onGenerateRoute: NavigationService().onGenerateRoute,
      navigatorKey: NavigationService().navigatorKey,
    );
  }
}
