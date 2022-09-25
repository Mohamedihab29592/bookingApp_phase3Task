import 'dart:developer';
import 'package:booking_app/core/error/exceptions.dart';
import 'package:booking_app/core/local/cache_helper.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/network/network.dart';
import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/home/data/models/hotels_model.dart';
import 'package:booking_app/features/home/data/models/profile_model.dart';

abstract class BaseHomeDataRemoteDataSource {
  Future<HotelsModel> getHomeData({required int page});

  Future<ProfileModel> getProfileData();
}

class HomeDataRemoteDataSource implements BaseHomeDataRemoteDataSource {
  var token = CacheHelper.getData(key: AppStrings.token);

  @override
  Future<HotelsModel> getHomeData({required int page}) async {
    final response = await DioHelper.getData(url: hotelsEndPoint, query: {
      "count": 10,
      "page": page,
    });
    if (response.statusCode == 200 && response.data['status']['type'] == '1') {
      log('home data is ${response.data}');
      return HotelsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProfileModel> getProfileData() async {
    final response = await DioHelper.getData(
      url: profileEndPoint,
      token: token,
    );
    if (response.statusCode == 200 && response.data['status']['type'] == '1') {
      log('profile data is ${response.data}');
      return ProfileModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
