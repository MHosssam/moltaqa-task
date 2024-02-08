import 'package:flutter/material.dart';
import 'package:task/config/routes/app_routes.dart';
import 'package:task/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  void splashTimer() async {
    await Future.wait([Future.delayed(const Duration(seconds: 3))]).then(
      (value) => Navigator.pushNamed(context, Routes.loginRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(ImageAssets.logo)));
  }
}
