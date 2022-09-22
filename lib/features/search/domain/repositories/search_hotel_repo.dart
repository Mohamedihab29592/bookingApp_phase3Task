import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/features/search/data/models/search_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/search_entity.dart';

abstract class BaseSearchHotelRepository {
  Future<Either<Failure, SearchModel>> searchHotel(
      {required UserSearchEntity userSearchEntity});
}