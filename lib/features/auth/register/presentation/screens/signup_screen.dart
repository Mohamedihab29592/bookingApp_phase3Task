import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/toast.dart';
import 'package:booking_app/features/auth/register/domain/entities/user_info_entity.dart';
import 'package:booking_app/features/auth/register/presentation/cubit/user_register_cubit.dart';
import 'package:booking_app/features/auth/widgets/google_button.dart';
import 'package:booking_app/core/component/my_button.dart';
import 'package:booking_app/core/component/my_text.dart';
import 'package:booking_app/core/component/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/core/di/injection_container.dart' as di;

import '../../../../../core/routes/routes_manager.dart';
import '../../../../../core/utilis/constants/app_strings.dart';
import '../../../../../core/utilis/constants/colors.dart';
import '../../../../../core/utilis/constants/values_manger.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  bool _isHidePass = true;
  bool _isHidePasss = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<UserRegisterCubit>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: AppSize.s0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: MyText(
                      text: AppStrings.signUp.tr(context),
                      fontSize: AppSize.s28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  BlocConsumer<UserRegisterCubit,UserRegisterState>
                    (
                      listener: (context, state) {},
                    builder:(context,state)=>Align(
                      alignment: Alignment.center,
                      child: MySignButton(
                        ontap: () {
                          UserRegisterCubit.get(context).registerWithGoogle();
                        },
                      )),
                       ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  Center(
                    child: MyText(
                      text: AppStrings.orLoginWith.tr(context),
                      fontSize: AppSize.s15,
                      colors: AppColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  MyTextForm(
                    labelText: AppStrings.name.tr(context),
                    isDense: true,
                    radius: AppSize.s40,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.nameHint.tr(context);
                      }
                      return null;
                    },
                    textInputType: TextInputType.name,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  MyTextForm(
                    labelText: AppStrings.email.tr(context),
                    isDense: true,
                    radius: AppSize.s40,
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emailHint.tr(context);
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  MyTextForm(
                    isPassword: _isHidePass,
                    suffixIcon:
                        _isHidePass ? Icons.visibility_off : Icons.visibility,
                    suffixIconPressed: () {
                      setState(() {
                        _isHidePass = !_isHidePass;
                      });
                    },
                    labelText: AppStrings.password.tr(context),
                    isDense: true,
                    radius: AppSize.s40,
                    textInputType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.passHint.tr(context);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  MyTextForm(
                    isPassword: _isHidePasss,
                    suffixIcon:
                        _isHidePasss ? Icons.visibility_off : Icons.visibility,
                    suffixIconPressed: () {
                      setState(() {
                        _isHidePasss = !_isHidePasss;
                      });
                    },
                    labelText: AppStrings.confirmedPassword.tr(context),
                    isDense: true,
                    radius: AppSize.s40,
                    textInputType: TextInputType.visiblePassword,
                    controller: confirmPassController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          passwordController.text !=
                              confirmPassController.text) {
                        return AppStrings.passHintMatch.tr(context);
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: AppSize.s50,
                        width: double.infinity,
                        child:
                            BlocConsumer<UserRegisterCubit, UserRegisterState>(
                          listener: (BuildContext context, state) {
                            if (state is UserRegisterSuccessState) {
                              showToast(
                                text: AppStrings.successRegisterEn.tr(context),
                                state: ToastStates.success,
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.loginRoute,
                              );
                            }

                            if (state is UserRegisterErrorState)
                              {
                                showToast(
                                text: AppStrings.errorRegisterEn,
                                state: ToastStates.error,
                              );

                              }
                          },
                          builder: (BuildContext context, Object? state) {
                            var cubit = UserRegisterCubit.get(context);
                            if (state is! UserRegisterLoadingState) {
                              return MyButton(
                                width: double.infinity,

                                label: AppStrings.signUp.tr(context),
                                fontWeight: FontWeight.w700,
                                fontSize: AppSize.s15,
                                onPressed: () {
                                  FocusManager.instance.primaryFocus!.unfocus();

                                  if (_formKey.currentState!.validate()) {
                                    cubit.registerWithEmail(
                                      userInfoEntity: UserInfoEntity(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        passwordConfirmation:
                                            passwordController.text,
                                        // image: cubit.userImage ?? File('p',),
                                      ),
                                    );
                                  }
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(color: AppColors.teal,),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            text: AppStrings.policy.tr(context),
                            fontSize: AppSize.s12,
                            colors: AppColors.grey,
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                text: AppStrings.haveAnAccount.tr(context),
                                fontSize: AppSize.s15,
                                colors: AppColors.grey,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.loginRoute);
                                },
                                child: Text(
                                  AppStrings.logIn.tr(context),
                                  style: const TextStyle(
                                      color: AppColors.teal,

                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
