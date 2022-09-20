import 'package:booking_app/core/local/cache_helper.dart';
import 'package:booking_app/core/netowrk/network_.dart';
import 'package:booking_app/features/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:booking_app/features/auth/register/data/repositories/register_repository_impl.dart';
import 'package:booking_app/features/auth/register/domain/repositories/base_register_repository.dart';
import 'package:booking_app/features/auth/register/domain/use_cases/register_email_usecase.dart';
import 'package:booking_app/features/auth/register/presentation/cubit/user_register_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'features/auth/login/data/repositories/login_repository_impl.dart';
import 'features/auth/login/domain/repositories/base_login_repository.dart';
import 'features/auth/login/domain/use_cases/login_email_usecase.dart';
import 'features/auth/login/presentation/cubit/login_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// External
  DioHelper();
  CacheHelper.init();

  /// Cubit
  sl.registerFactory(() => UserRegisterCubit(registerWithEmailUseCase: sl()));

  /// Use Cases
  sl.registerLazySingleton(
      () => RegisterWithEmailUseCase(registerRepository: sl()));

  /// Repository
  sl.registerLazySingleton<BaseRegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDataSource: sl()));

  /// Data Sources
  sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
      () => RegisterRemoteDataSource());

  /// Core



  /// Cubit
  sl.registerFactory(() => LoginCubit(loginUseCase: sl()));

  /// Use Cases
  sl.registerLazySingleton(
          () => LoginUseCase(loginRepository: sl()));

  /// Repository
  sl.registerLazySingleton<BaseLoginRepository>(
          () => LoginRepositoryImpl(loginRemoteDataSource: sl()));

  /// Data Sources
  sl.registerLazySingleton<BaseLoginRemoteDataSource>(
          () => LoginRemoteDataSource());
}
