import 'package:flutter/material.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? appBarColor;
  final String? title;
  final TextAlign? textAlign;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Widget? titleWidget;

  const CustomAppBar({
    Key? key,
    this.appBarColor,
    this.title,
    this.textAlign,
    this.leadingWidget,
    this.trailingWidget,
    this.titleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQueryData.fromView(View.of(context)).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      width: double.infinity,
      height: preferredSize.height + statusBarHeight,
      color: appBarColor ?? context.colorScheme.background,
      child: SizedBox(
        height: preferredSize.height,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            leadingWidget ?? SizedBox(width: preferredSize.height, height: preferredSize.height),
            if (title != null) ...[
              Expanded(
                child: Text(
                  title ?? '',
                  textAlign: textAlign ?? TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.onBackground,
                  ),
                ),
              ),
            ] else if (titleWidget != null) ...[
              Expanded(child: titleWidget ?? const SizedBox.shrink()),
            ] else ...[
              const Spacer(),
            ],
            trailingWidget ?? SizedBox(width: preferredSize.height, height: preferredSize.height),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(MySizes.appBarHeight);
}
