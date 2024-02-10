import 'package:flutter/material.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/app_elevated_button.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(MySizes.defaultPadding),
      padding: const EdgeInsets.all(MySizes.defaultPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(MySizes.buttonHeight * 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppElevatedButton(
              btnText: 'المستلمة',
              height: MySizes.buttonHeight * 1.7,
              borderRadius: BorderRadius.circular(MySizes.buttonHeight),
              // gradient:
              //     isSent ? null : const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
              // textStyle: isSent
              //     ? null
              //     : context.textTheme.bodyLarge?.copyWith(
              //         fontWeight: FontWeight.w600,
              //         color: context.colorScheme.onBackground,
              //       ),

              onPressed: () {
                // isSent = false;
              },
            ),
          ),
          10.pw,
          Expanded(
            child: AppElevatedButton(
              btnText: 'المرسلة',
              height: MySizes.buttonHeight * 1.7,
              borderRadius: BorderRadius.circular(MySizes.buttonHeight),
              // gradient:
              //     isSent ? const LinearGradient(colors: [Colors.transparent, Colors.transparent]):null,
              // textStyle: isSent
              //      context.textTheme.bodyLarge?.copyWith(
              //         fontWeight: FontWeight.w600,
              //         color: context.colorScheme.onBackground,
              //       ):null,
              onPressed: () {
                // isSent = true;
              },
            ),
          ),
        ],
      ),
    );
  }
}
