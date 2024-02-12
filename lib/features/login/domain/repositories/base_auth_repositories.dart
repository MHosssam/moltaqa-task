import 'package:dartz/dartz.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/login/data/models/login_model.dart';
import 'package:task/features/login/domain/usecases/login.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, LoginModel>> login({required CreateLoginModel model});
}
