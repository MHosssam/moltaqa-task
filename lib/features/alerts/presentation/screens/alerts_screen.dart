import 'package:flutter/material.dart';
import 'package:task/core/widget/custom_appbar.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'تنبيهاتي'),
      body: Column(
        children: [
          Container(),
          const Placeholder(),
        ],
      ),
    );
  }
}
