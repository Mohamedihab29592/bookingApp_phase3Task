import 'package:booking_app/core/local/cache_helper.dart';
import 'package:booking_app/core/netowrk/network_.dart';
import 'package:booking_app/features/auth/register/data/data_sources/register_remote_data_source.dart';
import 'package:booking_app/features/auth/register/data/repositories/register_repository_impl.dart';
import 'package:booking_app/features/auth/register/domain/repositories/base_register_repository.dart';
import 'package:booking_app/features/auth/register/domain/use_cases/register_email_usecase.dart';
import 'package:booking_app/features/auth/register/presentation/cubit/user_register_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  /// features Weather

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

}
