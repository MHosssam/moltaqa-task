import 'package:flutter/material.dart';
import 'package:task/core/utils/app_strings.dart';
import 'package:task/features/splash/presentation/screens/splash_screen.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme().getTheme(Brightness.light),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? Container(),
      ),
    );
  }
}
