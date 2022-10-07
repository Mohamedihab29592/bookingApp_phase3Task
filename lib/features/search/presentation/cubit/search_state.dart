part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchHotelLoadingState extends SearchState {}

class SearchHotelSuccessState extends SearchState {}
class SearchDeleteSuccessState extends SearchState {}

class SearchHotelErrorState extends SearchState {
  final String error;

  SearchHotelErrorState({required this.error});
}

class GetFacilitiesLoadingState extends SearchState {}

class GetFacilitiesSuccessState extends SearchState {}

class SelectFacilityState extends SearchState {}

class GetFacilitiesErrorState extends SearchState {
  final String error;

  GetFacilitiesErrorState({required this.error});
}
