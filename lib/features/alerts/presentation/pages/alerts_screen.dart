import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/custom_appbar.dart';
import 'package:task/features/alerts/presentation/bloc/alert_cubit.dart';
import '../widget/received_cell.dart';
import '../widget/sent_cell.dart';
import '../widget/search_filter_widget.dart';
import '../widget/tabs_widget.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AlertCubit>().alertsParams.userType = 'receiver';
    context.read<AlertCubit>().getAlertDataFun();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<AlertCubit>().getAlertDataFun();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تنبيهاتي', appBarColor: context.colorScheme.onPrimary),
      body: Column(
        children: [
          const SearchFilterWidget(),
          const TabsWidget(),
          Expanded(
            child: BlocBuilder<AlertCubit, AlertState>(
              builder: (context, state) {
                if (state is AlertLoading) {
                  return Center(child: context.loading);
                } else {
                  final alertList = context.watch<AlertCubit>().alertList;
                  return ListView.separated(
                    controller: scrollController,
                    itemCount: (state is AlertLoading ? 9 : 0) + (alertList.length),
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => 8.ph,
                    padding: const EdgeInsets.only(
                      left: MySizes.defaultPadding,
                      right: MySizes.defaultPadding,
                      bottom: MySizes.defaultPadding,
                    ),
                    itemBuilder: (context, index) {
                      if (context.watch<AlertCubit>().isReceived) {
                        if (index >= alertList.length) {
                          if (state is AlertLoadingMore || state is AlertLoading) {
                            return const ReceivedCell(isLoading: true);
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                        return ReceivedCell(isLoading: false, receiverData: alertList[index]);
                      } else {
                        if (index >= alertList.length) {
                          if (state is AlertLoadingMore || state is AlertLoading) {
                            return const SentCell(isLoading: true);
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                        return SentCell(isLoading: false, sentData: alertList[index]);
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
