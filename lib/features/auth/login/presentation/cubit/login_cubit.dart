import 'package:booking_app/core/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

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



  // Future<String?> signInwithGoogle2() async {
  //   emit(CreateGoogleUserLoadingState());
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //     await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //     await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     emit(CreateGoogleUserSuccessState());
  //     await _auth.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (errrorrrrrr) {
  //     print('errrorrrrrr${errrorrrrrr.message}');
  //     throw errrorrrrrr;
  //   }
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential> signInwithGoogle() async {
    emit(CreateGoogleUserLoadingState());

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    emit(CreateGoogleUserSuccessState());
    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }


  Future<void> signOutFromGoogle() async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
