import 'package:booking_app/core/error/failures.dart';
import 'package:booking_app/core/usecases/usecase.dart';
import 'package:booking_app/core/utilis/constants/app_strings.dart';
import 'package:booking_app/features/search/data/models/search_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/search_entity.dart';
import '../../domain/use_case/search_hotel_usecase.dart';

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
}