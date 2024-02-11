import 'package:dartz/dartz.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/core/usecases/usecases.dart';
import 'package:task/features/login/data/models/create_login_model.dart';
import 'package:task/features/login/data/models/login_model.dart';
import 'package:task/features/login/domain/repositories/auth_repositories.dart';

class Login extends UseCase<LoginModel, CreateLoginModel> {
  final AuthRepository repository;
  Login({required this.repository});
  @override
  Future<Either<Failure, LoginModel>> call(CreateLoginModel model) async {
    return await repository.login(model: model);
  }
}
