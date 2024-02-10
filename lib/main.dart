import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/core/constant/app_strings.dart';
import 'package:task/features/splash/splash_screen.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/local/TokenUtil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await TokenUtil.loadTokenToMemory();

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
