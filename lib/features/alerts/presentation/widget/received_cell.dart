import 'package:flutter/material.dart';
import 'package:task/core/constant/assets_manager.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/custom_divider.dart';
import 'package:task/core/widget/shimmer_widget.dart';
import 'package:task/features/alerts/domain/entities/alerts.dart';
import 'package:task/features/alerts/presentation/widget/row_value.dart';

class ReceivedCell extends StatelessWidget {
  final bool isLoading;
  final Alerts? receiverData;
  const ReceivedCell({super.key, required this.isLoading, this.receiverData});

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
                  receiverData?.status == 'finished'
                      ? ImageAssets.notificationRead
                      : ImageAssets.notification,
                  width: MySizes.largePadding,
                  height: MySizes.largePadding,
                ),
                8.pw,
                Expanded(child: Text('موعد اجتماع', style: context.textTheme.titleLarge)),
                if (receiverData?.status == 'finished')
                  Image.asset(
                    ImageAssets.trash,
                    width: MySizes.largePadding,
                    height: MySizes.largePadding,
                  ),
              ],
            ),
          ),
          CustomDivider(isVertical: false, size: context.width),
          15.ph,
          isLoading
              ? const ShimmerWidget(height: MySizes.defaultPadding)
              : RowValue(
                  icon: ImageAssets.user,
                  title: 'مرسل التنبيه',
                  image: ImageAssets.userImage,
                  value: receiverData?.senderName ?? '',
                  isFinished: receiverData?.status == 'finished',
                ),
          6.ph,
          isLoading
              ? const ShimmerWidget(height: MySizes.defaultPadding)
              : RowValue(
                  title: 'تاريخ التذكير',
                  icon: ImageAssets.calender,
                  value: receiverData?.sendDate ?? '',
                  textColor: context.colorScheme.primary,
                ),
          6.ph,
          isLoading
              ? const ShimmerWidget(height: MySizes.defaultPadding)
              : RowValue(
                  title: 'وقت التذكير',
                  icon: ImageAssets.clock,
                  value: receiverData?.sendTime ?? '',
                  textColor: context.colorScheme.primary,
                ),
          if (receiverData?.status != 'finished') ...[
            6.ph,
            CustomDivider(isVertical: false, size: context.width * 0.7),
            Row(
              children: [
                Expanded(
                  child: isLoading
                      ? const ShimmerWidget(height: MySizes.defaultPadding)
                      : GestureDetector(
                          child: Text(
                            'قبول',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        ),
                ),
                const CustomDivider(isVertical: true, size: MySizes.buttonHeight * 1.4),
                Expanded(
                  child: isLoading
                      ? const ShimmerWidget(height: MySizes.defaultPadding)
                      : GestureDetector(
                          child: Text(
                            'رفض',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.colorScheme.error,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
