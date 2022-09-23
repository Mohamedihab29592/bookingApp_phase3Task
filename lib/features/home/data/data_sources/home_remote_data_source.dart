import 'dart:developer';

import 'package:booking_app/core/error/exceptions.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/network/network.dart';
import 'package:booking_app/features/home/data/models/hotels_model.dart';

abstract class BaseHomeDataRemoteDataSource {
  Future<HotelsModel> getHomeData({required int page});
}

class HomeDataRemoteDataSource implements BaseHomeDataRemoteDataSource {
  @override
  Future<HotelsModel> getHomeData({required int page}) async {
    final response = await DioHelper.getData(url: hotelsEndPoint, query: {
      "count" : 10,
      "page" : page,
    });
    if (response.statusCode == 200 && response.data['status']['type'] == '1') {
      log('home data is ${response.data}');
      return HotelsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
