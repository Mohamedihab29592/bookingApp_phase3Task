import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/toast.dart';
import 'package:booking_app/core/routes/routes_manager.dart';
import 'package:booking_app/features/auth/login/domain/entities/user_login_entity.dart';
import 'package:booking_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:booking_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:booking_app/features/auth/widgets/google_button.dart';
import 'package:booking_app/core/component/my_button.dart';
import 'package:booking_app/core/component/my_text.dart';
import 'package:booking_app/core/component/my_text_form_field.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/injection_container.dart' as di;

import '../../../../../core/utilis/constants/app_strings.dart';
import '../../../../../core/utilis/constants/colors.dart';
import '../../../../../core/utilis/constants/values_manger.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isHidePass = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LoginCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppSize.s100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          MyText(
                            text: AppStrings.logIn.tr(context),
                            fontSize: AppSize.s28,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s15,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is CreateGoogleUserSuccessState) {
                              showToast(
                                text: AppStrings.successLoginEn.tr(context),
                                state: ToastStates.success,
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.homeLayout,
                              );
                            }
                          },
                          builder: (context, state) {
                            return MySignButton(
                              ontap: () {
                                LoginCubit.get(context).signInwithGoogle();
                              },
                            );
                          },
                        )),
                    const SizedBox(
                      height: AppSize.s15,
                    ),
                    Center(
                      child: MyText(
                        text: AppStrings.orLoginWith.tr(context),
                        fontSize: AppSize.s15,
                        colors: AppColors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    MyTextForm(
                      isDense: true,
                      radius: AppSize.s40,
                      labelText: AppStrings.email.tr(context),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.emailHint.tr(context);
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: AppSize.s15),
                    MyTextForm(
                      isPassword: _isHidePass,
                      suffixIcon:
                          _isHidePass ? Icons.visibility_off : Icons.visibility,
                      suffixIconPressed: () {
                        setState(() {
                          _isHidePass = !_isHidePass;
                        });
                      },
                      radius: AppSize.s40,
                      labelText: AppStrings.password.tr(context),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.passHint.tr(context);
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: AppSize.s15),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: MyText(
                        text: AppStrings.passForget.tr(context),
                        fontSize: AppSize.s15,
                        colors: AppColors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s15,
                    ),
                    Column(
                      children: [
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (BuildContext context, state) {
                              if (state is LoginSuccessState) {
                                showToast(
                                  text: AppStrings.successLoginEn.tr(context),
                                  state: ToastStates.success,
                                );
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.homeLayout,
                                );
                              }
                              if (state is LoginErrorState) {
                                showToast(
                                  text: AppStrings.errorLoginEn.tr(context),
                                  state: ToastStates.error,
                                );
                              }
                            },
                            builder: (BuildContext context, Object? state) {
                              var cubit = LoginCubit.get(context);
                              if (state is! LoginLoadingState) {
                                return MyButton(
                                  width: double.infinity,
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus!
                                        .unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      cubit.loginEmail(
                                          userLoginEntity: UserLoginEntity(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text));
                                    }
                                  },
                                  label: AppStrings.logIn.tr(context),
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.s18,
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.teal,
                                  ),
                                );
                              }
                            },
                          ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: AppStrings.haveNotAnAccount.tr(context),
                          fontSize: AppSize.s15,
                          colors: AppColors.grey,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.registerRoute);
                            },
                            child: Text(
                              AppStrings.createAcc.tr(context),
                              style: TextStyle(color: AppColors.teal),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
