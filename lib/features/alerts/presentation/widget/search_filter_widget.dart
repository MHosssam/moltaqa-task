import 'package:flutter/material.dart';
import 'package:task/core/constant/assets_manager.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/custom_text_form_field.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.only(
        left: MySizes.defaultPadding * 0.8,
        right: MySizes.defaultPadding * 0.8,
        bottom: MySizes.defaultPadding * 0.8,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(MySizes.defaultRadius),
          bottomRight: Radius.circular(MySizes.defaultRadius),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              prefixWidget: Image.asset(ImageAssets.search),
              hintText: 'ابحث بالاسم، رقم الجوال او عنوان التنبيه',
            ),
          ),
          10.pw,
          Container(
            height: MySizes.buttonHeight * 1.2,
            padding: const EdgeInsets.all(MySizes.defaultPadding * 0.5),
            decoration: BoxDecoration(
              borderRadius: MySizes.borderRadius,
              color: context.colorScheme.background,
            ),
            child: Image.asset(ImageAssets.filter),
          ),
        ],
      ),
    );
  }
}
