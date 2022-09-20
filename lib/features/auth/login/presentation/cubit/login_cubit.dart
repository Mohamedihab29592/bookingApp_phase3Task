import 'package:booking_app/core/error/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        print('fail');
        return emit(
            LoginErrorState(error: _mapFailureToMsg(failure: failure)));
      }, (unit) {
        print('success');
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


}
