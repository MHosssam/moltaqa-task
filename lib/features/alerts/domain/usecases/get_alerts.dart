import 'package:dartz/dartz.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/core/usecases/usecases.dart';
import 'package:task/features/alerts/data/models/alert_model.dart';
import 'package:task/features/alerts/domain/repositories/base_alerts_repositories.dart';

class GetReceiverData extends UseCase<AlertModel, AlertsParams> {
  final BaseAlertsRepository baseRepository;
  GetReceiverData({required this.baseRepository});

  @override
  Future<Either<Failure, AlertModel>> call(AlertsParams model) async {
    return await baseRepository.getReceiverData(params: model);
  }
}

class AlertsParams {
  String? userType;
  String? status;
  String? rStatus;

  AlertsParams({this.userType, this.status, this.rStatus});
}
