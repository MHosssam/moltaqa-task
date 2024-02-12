import 'package:flutter/material.dart';
import 'package:task/core/constant/assets_manager.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/custom_divider.dart';
import 'package:task/core/widget/shimmer_widget.dart';
import 'package:task/features/alerts/domain/entities/alerts.dart';
import 'package:task/features/alerts/presentation/widget/row_value.dart';

class SentCell extends StatelessWidget {
  final bool isLoading;
  final Alerts? sentData;
  const SentCell({super.key, required this.isLoading, this.sentData});

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
                Image.asset(
                  sentData?.reminderStatus == 'finished'
                      ? ImageAssets.notificationRead
                      : ImageAssets.notification,
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
          isLoading
              ? const ShimmerWidget(height: MySizes.defaultPadding)
              : RowValue(
                  title: 'المرسل اليه',
                  icon: ImageAssets.user,
                  value: sentData?.senderName ?? '',
                ),
          6.ph,
          isLoading
              ? const ShimmerWidget(height: MySizes.defaultPadding)
              : RowValue(
                  icon: ImageAssets.calender,
                  title: 'تاريخ التذكير',
                  value: sentData?.sendDate ?? '',
                  textColor: context.colorScheme.primary,
                ),
          6.ph,
          isLoading
              ? const ShimmerWidget(height: MySizes.defaultPadding)
              : RowValue(
                  icon: ImageAssets.clock,
                  title: 'وقت التذكير',
                  value: sentData?.sendTime ?? '',
                  textColor: context.colorScheme.primary,
                ),
          6.ph,
          CustomDivider(isVertical: false, size: context.width * 0.7),
          6.ph,
          if (sentData?.reminderStatus == 'finished')
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
          if (sentData?.reminderStatus != 'finished')
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
