import 'package:flutter/material.dart';
import 'package:task/core/constant/assets_manager.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';

class RowValue extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final String? image;
  final Color? textColor;
  final bool? isFinished;
  const RowValue({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.image,
    this.textColor,
    this.isFinished = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MySizes.defaultPadding),
      child: Row(
        children: [
          Image.asset(icon, width: MySizes.largePadding, height: MySizes.largePadding),
          8.pw,
          Expanded(flex: 1, child: Text('$title :')),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (image != null) ...[
                  Image.asset(image ?? '', width: MySizes.largePadding, height: MySizes.largePadding),
                  8.pw,
                ],
                Expanded(
                  child: Text(
                    value,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isFinished ?? false) ...[
                  Image.asset(
                    ImageAssets.sent,
                    width: MySizes.largePadding,
                    height: MySizes.largePadding,
                  ),
                  8.pw,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
