import 'package:dartz/dartz.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/alerts/data/models/alert_model.dart';
import 'package:task/features/alerts/domain/usecases/get_alerts.dart';

abstract class BaseAlertsRepository {
  Future<Either<Failure, AlertModel>> getReceiverData({required AlertsParams params});
}
