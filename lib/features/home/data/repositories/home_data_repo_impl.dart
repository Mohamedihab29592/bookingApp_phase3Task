import 'package:booking_app/core/error/exceptions.dart';
import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/core/netowrk/info.dart';
import 'package:booking_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booking_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booking_app/features/home/domain/entities/hotels_entity.dart';
import 'package:booking_app/features/home/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';

class HomeDataRepositoryImpl extends BaseHomeDataRepository {
  final BaseHomeDataRemoteDataSource homeDataRemoteDataSource;
  final BaseHomeDataLocalDataSource homeDataLocalDataSource;
  final NetworkInfo networkInfo;

  HomeDataRepositoryImpl({
    required this.homeDataRemoteDataSource,
    required this.homeDataLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, HotelsEntity>> getHomeData({required int page}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHome = await homeDataRemoteDataSource.getHomeData(page: page);
        homeDataLocalDataSource.cachedHomeData(hotelsModel: remoteHome);
        return Right(remoteHome);
      } on ServerException {
        throw Left(ServerFailure());
      }
    } else {
      try {
        final localHome = await homeDataLocalDataSource.getCachedHomeData();
        return Right(localHome);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
