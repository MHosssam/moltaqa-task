import 'package:dartz/dartz.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/core/usecases/usecases.dart';
import 'package:task/features/login/data/models/login_model.dart';
import 'package:task/features/login/domain/repositories/base_auth_repositories.dart';

class Login extends UseCase<LoginModel, CreateLoginModel> {
  final BaseAuthRepository baseRepository;
  Login({required this.baseRepository});
  @override
  Future<Either<Failure, LoginModel>> call(CreateLoginModel model) async {
    return await baseRepository.login(model: model);
  }
}

class CreateLoginModel {
  String? mobile;
  String? password;

  CreateLoginModel({this.mobile, this.password});
}

