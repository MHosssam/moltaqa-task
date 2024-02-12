import 'package:task/core/constant/app_strings.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/utils/Enums.dart';
import 'package:task/core/utils/NetworkCallback.dart';
import 'package:task/features/alerts/data/models/alert_model.dart';
import 'package:task/features/alerts/domain/usecases/get_alerts.dart';

abstract class AlertsRemoteDataSource {
  Future<AlertModel> getReceiverData({required AlertsParams params});
}

class AlertsRemoteDataSourceImpl implements AlertsRemoteDataSource {
  AlertsRemoteDataSourceImpl();

  @override
  Future<AlertModel> getReceiverData({required AlertsParams params}) async {
    try {
      Map<String, dynamic> queryParams = {};
      if (params.userType != null) {
        queryParams.addAll({
          "user_type": params.userType,
        });
      }
      if (params.status != null) {
        queryParams.addAll({
          "status": params.status,
        });
      }
      if (params.rStatus != null) {
        queryParams.addAll({
          "r_Status": params.rStatus,
        });
      }
      final response = await NetworkCall.makeCall(
        method: HttpMethod.get,
        queryParams: queryParams,
        endPoint: AppString.remindersEnd,
      );
      if (response['status'] == 200) {
        return AlertModel.fromJson(response);
      } else {
        throw StatusException(message: "خطأ في  بيانات ");
      }
    } on UnauthorizedException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
