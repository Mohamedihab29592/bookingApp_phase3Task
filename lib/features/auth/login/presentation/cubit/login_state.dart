abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}

class SuccessGetUserImageState extends LoginState {}

class ErrorGetUserImageState extends LoginState {}





///LoginGoogleUSer State
class LoginGoogleUserLoadingState extends LoginState{}
class LoginGoogleUserSuccessState extends LoginState{}
class LoginGoogleUserErrorState extends LoginState{}
