import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/core/local/TokenUtil.dart';
import 'package:task/features/login/data/datasources/auth_remote_datasourse.dart';
import 'package:task/features/login/data/repositories/auth_repositories_impl.dart';
import 'package:task/features/login/domain/repositories/auth_repositories.dart';
import 'package:task/features/login/domain/usecases/login.dart';

import 'features/login/presentation/bloc/login_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  await GetStorage.init();
  await TokenUtil.loadTokenToMemory();
  loginInj();
}

void loginInj() {
  //* provider
  sl.registerFactory(() => LoginCubit(login: sl()));

  //* Use cases
  sl.registerLazySingleton(() => Login(repository: sl()));

  //* Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: sl()),
  );

  //* Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //   () => AuthLocalDataSourceImpl(
  //     sharedPreference: sl(),
  //   ),
  // );
}
