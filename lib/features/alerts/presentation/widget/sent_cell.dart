import 'package:flutter/material.dart';
import 'package:task/core/constant/assets_manager.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/custom_divider.dart';
import 'package:task/features/alerts/presentation/widget/row_value.dart';

class SentCell extends StatelessWidget {
  const SentCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: MySizes.borderRadius,
        color: context.colorScheme.primary.withOpacity(0.08),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: MySizes.defaultPadding,
              left: MySizes.defaultPadding,
              right: MySizes.defaultPadding,
              bottom: MySizes.defaultPadding * 0.7,
            ),
            child: Row(
              children: [
                // if status = finished : use this => notificationRead
                Image.asset(
                  ImageAssets.notification,
                  width: MySizes.largePadding,
                  height: MySizes.largePadding,
                ),
                8.pw,
                Expanded(child: Text('موعد اجتماع', style: context.textTheme.titleLarge)),
              ],
            ),
          ),
          CustomDivider(isVertical: false, size: context.width),
          15.ph,
          RowValue(
            icon: ImageAssets.user,
            title: 'المرسل اليه',
            value: 'احمد عادل',
          ),
          6.ph,
          RowValue(
            icon: ImageAssets.calender,
            title: 'تاريخ التذكير',
            value: '21/11/2023',
            textColor: context.colorScheme.primary,
          ),
          6.ph,
          RowValue(
            icon: ImageAssets.clock,
            title: 'وقت التذكير',
            value: '11:51 AM',
            textColor: context.colorScheme.primary,
          ),
          6.ph,
          CustomDivider(isVertical: false, size: context.width * 0.7),
          6.ph,
          GestureDetector(
            child: Text(
              'اعادة جدولة',
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          6.ph,
          GestureDetector(
            child: Text(
              'الغاء التنبيه',
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          6.ph,
        ],
      ),
    );
  }
}
