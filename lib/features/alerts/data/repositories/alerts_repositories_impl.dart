import 'package:dartz/dartz.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/alerts/data/datasources/alerts_remote_datasourse.dart';
import 'package:task/features/alerts/data/models/alert_model.dart';
import 'package:task/features/alerts/domain/repositories/base_alerts_repositories.dart';
import 'package:task/features/alerts/domain/usecases/get_alerts.dart';

class AlertsRepositoryImpl implements BaseAlertsRepository {
  final AlertsRemoteDataSource remote;

  AlertsRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, AlertModel>> getReceiverData({required AlertsParams params}) async {
    try {
      final receiverData = await remote.getReceiverData(params: params);

      return Right(receiverData);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? ''));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
