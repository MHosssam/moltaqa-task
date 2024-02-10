import 'package:flutter/material.dart';
import 'package:task/features/alerts/presentation/pages/alerts_screen.dart';
import 'package:task/features/login/presentation/pages/login_screen.dart';
import 'package:task/features/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String alertsRoute = '/alerts';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.alertsRoute:
        return MaterialPageRoute(builder: (context) => const AlertsScreen());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
