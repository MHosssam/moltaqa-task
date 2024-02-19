import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/app_elevated_button.dart';
import 'package:task/features/alerts/presentation/bloc/alert_cubit.dart';

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
      child: BlocBuilder<AlertCubit, AlertState>(
        builder: (context, state) => Row(
          children: [
            Expanded(
              child: AppElevatedButton(
                btnText: 'المستلمة',
                height: MySizes.buttonHeight * 1.7,
                borderRadius: BorderRadius.circular(MySizes.buttonHeight),
                gradient: context.watch<AlertCubit>().isReceived
                    ? null
                    : const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                textStyle: context.watch<AlertCubit>().isReceived
                    ? null
                    : context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.onBackground,
                      ),
                onPressed: () {
                  context.read<AlertCubit>().toggleBtnValue(val: true);
                  context.read<AlertCubit>().alertsParams.userType = 'receiver';
                  context.read<AlertCubit>().getAlertDataFun();
                },
              ),
            ),
            10.pw,
            Expanded(
              child: AppElevatedButton(
                btnText: 'المرسلة',
                height: MySizes.buttonHeight * 1.7,
                borderRadius: BorderRadius.circular(MySizes.buttonHeight),
                gradient: context.watch<AlertCubit>().isReceived
                    ? const LinearGradient(colors: [Colors.transparent, Colors.transparent])
                    : null,
                textStyle: context.watch<AlertCubit>().isReceived
                    ? context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.onBackground,
                      )
                    : null,
                onPressed: () {
                  context.read<AlertCubit>().toggleBtnValue(val: false);
                  context.read<AlertCubit>().alertsParams.userType = 'sent';
                  context.read<AlertCubit>().getAlertDataFun();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
