import 'package:get_it/get_it.dart';
import 'package:task/features/alerts/data/datasources/alerts_remote_datasourse.dart';
import 'package:task/features/alerts/data/repositories/alerts_repositories_impl.dart';
import 'package:task/features/alerts/domain/repositories/base_alerts_repositories.dart';
import 'package:task/features/alerts/domain/usecases/get_alerts.dart';
import 'package:task/features/alerts/presentation/bloc/alert_cubit.dart';
import 'package:task/features/login/data/datasources/auth_remote_datasourse.dart';
import 'package:task/features/login/data/repositories/auth_repositories_impl.dart';
import 'package:task/features/login/domain/repositories/base_auth_repositories.dart';
import 'package:task/features/login/domain/usecases/login.dart';
import 'package:task/features/login/presentation/bloc/login_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External

  loginInj();
  alertsInj();
}

void loginInj() {
  //* provider
  sl.registerFactory(() => LoginCubit(login: sl()));

  //* Use cases
  // sl.registerLazySingleton(() => ToggleUserBlockState(repository: sl()));
  // sl.registerLazySingleton(() => RegisterUserInformation(repository: sl()));
  sl.registerLazySingleton(() => Login(baseRepository: sl()));

  //* Repository
  sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepositoryImpl(remote: sl()));

  //* Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
}

void alertsInj() {
  //* provider
  sl.registerFactory(() => AlertCubit(getReceiverData: sl()));

  //* Use cases
  sl.registerLazySingleton(() => GetReceiverData(baseRepository: sl()));

  //* Repository
  sl.registerLazySingleton<BaseAlertsRepository>(() => AlertsRepositoryImpl(remote: sl()));

  //* Data sources
  sl.registerLazySingleton<AlertsRemoteDataSource>(() => AlertsRemoteDataSourceImpl());
}
