import 'package:flutter/material.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';

class AppElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback onPressed;
  final String btnText;
  final TextStyle? textStyle;

  const AppElevatedButton({
    Key? key,
    required this.onPressed,
    required this.btnText,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? MySizes.buttonHeight,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? MySizes.circleBorderRadius,
        gradient: gradient ??
            LinearGradient(
              colors: [
                context.colorScheme.secondary,
                context.colorScheme.surface,
                context.colorScheme.primary,
                context.colorScheme.primary,
              ],
            ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          btnText,
          style: textStyle ??
              context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
