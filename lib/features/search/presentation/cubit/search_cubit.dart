import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/core/network/network.dart';
import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/search/data/models/facilities_model.dart';
import 'package:booking_app/features/search/data/models/search_model.dart';
import 'package:booking_app/features/search/domain/entity/search_entity.dart';
import 'package:booking_app/features/search/domain/use_cases/search_hotel_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.searchHotelUseCase,
  }) : super(SearchInitial());
  final SearchHotelUseCase searchHotelUseCase;

  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;

  void searchForHotel({required UserSearchEntity userSearchEntity}) {
    emit(SearchHotelLoadingState());
    searchHotelUseCase.call(userSearchEntity: userSearchEntity).then((value) {
      value.fold((failure) {
        emit(SearchHotelErrorState(error: _mapFailureToMsg(failure: failure)));
      }, (model) {
        searchModel = model;
        emit(SearchHotelSuccessState());
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

  FacilitiesModel? facilitiesModel;

  void getFacilities() async {
    emit(GetFacilitiesLoadingState());
    DioHelper.getData(url: '/facilities').then((value) {
      facilitiesModel = FacilitiesModel.fromJson(value.data);
      emit(GetFacilitiesSuccessState());
    }).catchError((error) {
      emit(GetFacilitiesErrorState(error: error.toString()));
    });
  }

  TextEditingController searchController = TextEditingController();

  List<int> selectedFacilities = [];

  void selectFacility(int id) {
    if (selectedFacilities.contains(id)) {
      selectedFacilities.remove(id);
    } else {
      selectedFacilities.add(id);
    }

    emit(SelectFacilityState());
  }

  void searchForHotel2({required UserSearchEntity userSearchEntity}) {
    emit(SearchHotelLoadingState());
    searchHotelUseCase.call(userSearchEntity: userSearchEntity, facilities: {
      ...selectedFacilities.asMap().map(
            (key, value) => MapEntry(
              'facilities[$key]',
              value,
            ),
          ),
    }).then((value) {
      value.fold((failure) {
        emit(SearchHotelErrorState(error: _mapFailureToMsg(failure: failure)));
      }, (model) {
        searchModel = model;
        emit(SearchHotelSuccessState());
      });
    });
  }
}
