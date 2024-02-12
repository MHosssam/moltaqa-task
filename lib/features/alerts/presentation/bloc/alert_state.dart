part of 'alert_cubit.dart';

@immutable
abstract class AlertState extends Equatable {
  const AlertState();

  @override
  List<Object> get props => [];
}
class AlertInitial extends AlertState {}

class AlertLoading extends AlertState {}

class AlertLoadingMore extends AlertState {}

class AlertHasData extends AlertState {}

class AlertError extends AlertState {}
