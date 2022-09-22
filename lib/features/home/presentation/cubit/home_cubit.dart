import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/core/usecases/usecase.dart';
import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/home/domain/entities/hotels_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/features/home/domain/use_cases/get_home_data_usecase.dart';

import '../../../../core/local/cache_helper.dart';
import '../../../../core/routes/routes_manager.dart';
import '../screens/exploreScreen.dart';
import '../screens/profileScreen.dart';
import '../screens/tripsScreen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase homeDataUseCase;

  HomeCubit({required this.homeDataUseCase}) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const ExploreScreen(),
    const TripsScreen(),
    const ProfileScreen(),
  ];

  changeBottomNav(index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<Widget> bottomItems = [
    const Icon(Icons.search),
    const Icon(Icons.favorite),
    const Icon(Icons.person),
  ];
  HotelsEntity? hotelsEntity;
  int pageNo = 0;
  List<dynamic> data = [];

  void getHomeData({bool isFirst = true}) {
    if (isFirst) {
      pageNo = 0;
    }
    emit(GetHomeDataLoadingState());
    homeDataUseCase.call(params: NoParams(), page: 0).then((value) {
      value.fold((failure) {
        return emit(
            GetHomeDataErrorState(error: _mapFailureToMsg(failure: failure)));
      }, (hotelEntity) {
        hotelsEntity = hotelEntity;
        if (isFirst) {
          data = hotelsEntity!.homeEntity.data;
        } else {
          data.addAll(hotelsEntity!.homeEntity.data);
        }
        pageNo++;
        return emit(GetHomeDataSuccessState());
      });
    });
  }

  String _mapFailureToMsg({required Failure failure}) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case EmptyCacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unExpectedError;
    }
  }

  dynamic signOut(context) async {
    await CacheHelper.clearData('token').then((value) {
      if (value) {
        Navigator.pushReplacementNamed(
          context,
          Routes.loginRoute,
        );
      }
    });
  }
}
