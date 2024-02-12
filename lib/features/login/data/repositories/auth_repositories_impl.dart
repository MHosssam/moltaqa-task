import 'package:dartz/dartz.dart';
import 'package:task/core/error/exception.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/core/local/TokenUtil.dart';
import 'package:task/features/login/data/datasources/auth_remote_datasourse.dart';
import 'package:task/features/login/data/models/login_model.dart';
import 'package:task/features/login/domain/repositories/base_auth_repositories.dart';
import 'package:task/features/login/domain/usecases/login.dart';

class AuthRepositoryImpl implements BaseAuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, LoginModel>> login({required CreateLoginModel model}) async {
    try {
      final loginData = await remote.login(model: model);
      TokenUtil.saveToken(loginData.accessToken ?? '');
      return Right(loginData);
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? ''));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
