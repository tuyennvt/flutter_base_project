import 'package:flutter/material.dart';

import 'main/main_page.dart';
import 'widgets/error_page.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;
    switch (settings.name) {
      case MainPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
          settings: settings,
        );
    }
  }
}
