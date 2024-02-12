import 'package:task/core/constant/app_strings.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/utils/Enums.dart';
import 'package:task/core/utils/NetworkCallback.dart';
import 'package:task/features/login/data/models/login_model.dart';
import 'package:task/features/login/domain/usecases/login.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login({required CreateLoginModel model});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<LoginModel> login({required CreateLoginModel model}) async {
    try {
      final response = await NetworkCall.makeCall(
        method: HttpMethod.post,
        endPoint: AppString.loginEnd,
        requestBody: {"mobile": model.mobile, "password": model.password},
      );
      if (response['status'] == 200) {
        return LoginModel.fromJson(response['data']);
      } else {
        throw UnauthorizedException(message: "خطأ في  بيانات تسجيل الدخول");
      }
    } on UnauthorizedException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
