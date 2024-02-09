import 'package:flutter/material.dart';
import 'package:task/config/routes/app_routes.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/app_elevated_button.dart';
import 'package:task/core/widget/custom_text_form_field.dart';

class FormsWidget extends StatelessWidget {
  const FormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.height * 0.05),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'تسجيـل الدخـول',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            20.ph,
            const Text('رقم الجوال'),
            3.ph,
            CustomTextFormField(
              hintText: '****051211',
              keyboardType: TextInputType.number,
              suffixWidget: Padding(
                padding: const EdgeInsetsDirectional.only(end: MySizes.defaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.keyboard_arrow_down),
                    Text(
                      '+996',
                      style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
            12.ph,
            const Text('كلمة المرور'),
            3.ph,
            const CustomTextFormField(
              suffixBool: true,
              hintText: '********',
              keyboardType: TextInputType.visiblePassword,
            ),
            Text(
              'نسيت كلمة المرور',
              textAlign: TextAlign.end,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            30.ph,
            AppElevatedButton(
              btnText: 'تسجيـل الدخـول',
              onPressed: () => Navigator.pushNamed(context, Routes.alertsRoute),
            ),
            10.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ليس لديك حساب؟ ',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  'تسجيل جديد',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
