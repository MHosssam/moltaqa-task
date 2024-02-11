import 'package:flutter/material.dart';
import 'package:task/core/constant/extensions.dart';
import 'package:task/core/constant/my_sizes.dart';
import 'package:task/core/widget/custom_appbar.dart';
import '../widget/received_cell.dart';
import '../widget/sent_cell.dart';
import '../widget/search_filter_widget.dart';
import '../widget/tabs_widget.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تنبيهاتي',
        appBarColor: context.colorScheme.onPrimary,
      ),
      body: Column(
        children: [
          const SearchFilterWidget(),
          const TabsWidget(),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => 8.ph,
              padding: const EdgeInsets.only(
                left: MySizes.defaultPadding,
                right: MySizes.defaultPadding,
                bottom: MySizes.defaultPadding,
              ),
              itemBuilder: (context, index) => const SentCell(),
            ),
          ),
        ],
      ),
    );
  }
}
