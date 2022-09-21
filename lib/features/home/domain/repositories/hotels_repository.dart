import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/features/home/domain/entities/hotels_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseHomeDataRepository {
  Future<Either<Failure, HotelsEntity>> getHomeData({required int page});
}
