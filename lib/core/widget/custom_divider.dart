import 'package:flutter/material.dart';
import 'package:task/core/constant/extensions.dart';

class CustomDivider extends StatelessWidget {
  final double size;
  final bool isVertical;
  const CustomDivider({super.key, required this.size, required this.isVertical});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isVertical ? 2 : size,
      height: isVertical ? size : 2,
      color: context.colorScheme.onPrimary,
    );
  }
}
