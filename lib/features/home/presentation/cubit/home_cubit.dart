import 'dart:io';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/network/network.dart';
import 'package:booking_app/features/home/data/models/get_booking_model.dart';
import 'package:booking_app/features/home/data/models/update_profile_model.dart';
import 'package:booking_app/features/home/domain/use_cases/get_booking_usecase.dart';
import 'package:booking_app/features/home/domain/use_cases/update_profile_data_usecase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/core/usecases/usecase.dart';
import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/home/data/models/profile_model.dart';
import 'package:booking_app/features/home/domain/entities/hotels_entity.dart';
import 'package:booking_app/features/home/domain/use_cases/get_profile_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/features/home/domain/use_cases/get_home_data_usecase.dart';
import '../../../../core/local/cache_helper.dart';
import '../../../../core/routes/routes_manager.dart';
import '../screens/exploreScreen/exploreScreen.dart';
import '../screens/profileScreen/profileScreen.dart';
import '../screens/trips/presentation/screens/trips_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase homeDataUseCase;
  final GetProfileDataUseCase profileDataUseCase;
  final UpdateProfileDataUseCase updateProfileDataUseCase;
  final GetBookingUseCase bookingUseCase;

  HomeCubit({
    required this.homeDataUseCase,
    required this.profileDataUseCase,
    required this.updateProfileDataUseCase,
    required this.bookingUseCase,
  }) : super(HomeInitial());

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
  void getHomeData() {
    emit(GetHomeDataLoadingState());
    homeDataUseCase.call(params: NoParams(), page: 0).then((value) {
      value.fold((failure) {
        return emit(
            GetHomeDataErrorState(error: _mapFailureToMsg(failure: failure)));
      }, (hotelEntity) {
        hotelsEntity = hotelEntity;
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

  ProfileModel? profileModel;

  void getProfileData() {
    var token = CacheHelper.getData(key: AppStrings.token);
    emit(GetProfileDataLoadingState());
    profileDataUseCase.call(NoParams()).then((value) {
      value.fold((failure) {
        return emit(GetProfileDataErrorState(
            error: _mapFailureToMsg(failure: failure)));
      }, (model) {
        profileModel = model;
        return emit(GetProfileDataSuccessState());
      });
    });
  }

  File? userImage;
  final ImagePicker picker = ImagePicker();

  Future<void> addProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      userImage = File(pickedFile.path);
      emit(SuccessGetUserImageState());
    } else {
      debugPrint('No Image Selected');
      emit(ErrorGetUserImageState());
    }
  }

  UpdateProfileModel? updateProfileModel;

  void updateProfileData({required UpdateImageEntity updateImageEntity}) {
    emit(UpdateProfileDataLoadingState());
    updateProfileDataUseCase
        .call(UpdateImageEntity(updateImageEntity.name, updateImageEntity.email,
            updateImageEntity.image))
        .then((value) {
      value.fold((failure) {
        return emit(UpdateProfileDataErrorState(
            error: _mapFailureToMsg(failure: failure)));
      }, (model) {
        updateProfileModel = model;
        getProfileData();
        return emit(UpdateProfileDataSuccessState());
      });
    });
  }

  GetBookingModel? upComingModel;
  GetBookingModel? cancelledModel;
  GetBookingModel? completedModel;

  void getUpcomingBooking() {
    emit(GetBookingDataLoadingState());
    bookingUseCase.call(type: 'upcomming').then((value) {
      value.fold((failure) {
        return emit(GetBookingDataErrorState(
            error: _mapFailureToMsg(failure: failure)));
      }, (model) {
        upComingModel = model;
        return emit(GetBookingDataSuccessState());
      });
    });
  }

  void getCancelledBooking() {
    emit(GetCancelBookingDataLoadingState());
    bookingUseCase.call(type: 'cancelled').then((value) {
      value.fold((failure) {
        return emit(GetCancelBookingDataErrorState(
            error: _mapFailureToMsg(failure: failure)));
      }, (model) {
        cancelledModel = model;
        return emit(GetCancelBookingDataSuccessState());
      });
    });
  }

  void getCompletedBooking() {
    emit(GetCompletedBookingDataLoadingState());
    bookingUseCase.call(type: 'completed').then((value) {
      value.fold((failure) {
        return emit(GetCompletedBookingDataErrorState(
            error: _mapFailureToMsg(failure: failure)));
      }, (model) {
        completedModel = model;
        return emit(GetCompletedBookingDataSuccessState());
      });
    });
  }

  void dataData() async{
    emit(GetBookingDataLoadingState());
    final response = await DioHelper.getData(
      url: getBookingEndPoint,
      query: {
        "count": 10,
        "type": 'upcomming',
      },
      token: 'VFPhjbPtzCfhdhOLyAv5ueSMxWSk54jv87lFJ4YYEWA4aCuNWKYgIDm2GmS3',
    );
    print(response.data);
  }

  
}
