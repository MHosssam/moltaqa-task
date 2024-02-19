import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constant/app_strings.dart';
import 'package:task/features/alerts/presentation/bloc/alert_cubit.dart';
import 'package:task/features/login/presentation/bloc/login_cubit.dart';
import 'package:task/features/splash/splash_screen.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (BuildContext context) => sl<LoginCubit>()),
        BlocProvider<AlertCubit>(create: (BuildContext context) => sl<AlertCubit>()),
      ],
      child: MaterialApp(
        title: AppString.appName,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme().getTheme(Brightness.light),
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? Container(),
        ),
      ),
    );
  }
}
