import 'package:booking_app/core/error/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/local/cache_helper.dart';
import '../../../../../core/network/end_points.dart';
import '../../../../../core/network/network.dart';
import '../../../../../core/utilis/constants/app_strings.dart';
import '../../domain/entities/user_login_entity.dart';
import '../../domain/use_cases/login_email_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase})
      : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void loginEmail({required UserLoginEntity userLoginEntity}) async {
    emit(LoginLoadingState());
    await loginUseCase
        .call(UserLoginEntity(
      email: userLoginEntity.email,
      password: userLoginEntity.password,
    ))
        .then((value) {
      value.fold((failure) {
        if (kDebugMode) {
          print('fail');
        }
        return emit(
            LoginErrorState(error: _mapFailureToMsg(failure: failure)));
      }, (unit) {
        if (kDebugMode) {
          print('success');
        }
        return emit(LoginSuccessState());
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


  void signInWithGoogle() async {
    String email = "";
    String password = "";

    // Trigger the authentication flow
    emit(LoginGoogleUserLoadingState());
  await  GoogleSignIn().signIn().then((value) async{
      email =value!.email;
      password =value.displayName!;
    });
    await DioHelper.postData(url: loginEndPoint, data: {
      "email": email,
      "password": password,
    }).then((value) {
      CacheHelper.saveData(
          key: AppStrings.token, value: value.data['data']['api_token']);
      debugPrint(value.data.toString());
      emit(LoginGoogleUserSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(LoginGoogleUserErrorState());


    });
  }
}