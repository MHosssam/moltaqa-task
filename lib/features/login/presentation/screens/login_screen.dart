import 'package:flutter/material.dart';
import 'package:task/core/utils/assets_manager.dart';
import 'package:task/core/utils/extensions.dart';
import 'package:task/features/login/presentation/widget/forms_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.height * 0.1),
            child: Image.asset(ImageAssets.logo, width: 80, height: 80),
          ),
          25.ph,
          const Expanded(child: FormsWidget()),
        ],
      ),
    );
  }
}
