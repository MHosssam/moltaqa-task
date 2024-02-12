import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/alerts/domain/entities/alerts.dart';
import 'package:task/features/alerts/domain/usecases/get_alerts.dart';

part 'alert_state.dart';

class AlertCubit extends Cubit<AlertState> {
  final GetReceiverData getReceiverData;
  AlertCubit({required this.getReceiverData}) : super(AlertInitial());

  int nextPage = 1;
  bool isMore = false;
  List<Alerts> alertList = [];
  AlertsParams alertsParams = AlertsParams();

  Future<void> getAlertDataFun() async {
    emit(AlertLoading());
    alertList.clear();
    emitLoadingState(nextPage);
    final failOrUser = await getReceiverData(alertsParams);
    failOrUser.fold((fail) {
      emit(AlertError());
    }, (alertDate) {
      nextPage += 1;
      isMore = alertDate.links?.checkIfMore() ?? false;
      final x = alertDate.data ?? [];
      addToList(list: x);
      log(alertDate.toString());
      alertsParams = AlertsParams();
      emit(AlertHasData());
    });
  }

  void addToList({required List<Alerts> list, bool atFirst = false}) {
    if (atFirst) {
      alertList = [...list, ...alertList];
    } else {
      alertList = [...alertList, ...list];
    }
  }

  void emitLoadingState(int pageNumber) => pageNumber > 1 ? emit(AlertLoadingMore()) : emit(AlertLoading());

  bool isGetAlerts() => nextPage == 1 || isMore;
}
