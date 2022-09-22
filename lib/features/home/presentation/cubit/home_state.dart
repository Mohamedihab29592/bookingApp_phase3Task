part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetHomeDataSuccessState extends HomeState {}

class GetHomeDataLoadingState extends HomeState {}

class GetHomeDataErrorState extends HomeState {
  final String error;

  GetHomeDataErrorState({required this.error});
}
class ChangeBottomNavState extends HomeState{}

