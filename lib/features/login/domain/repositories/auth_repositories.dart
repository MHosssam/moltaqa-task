import 'package:dartz/dartz.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/features/login/data/models/create_login_model.dart';
import 'package:task/features/login/data/models/login_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> login({required CreateLoginModel model});
}
