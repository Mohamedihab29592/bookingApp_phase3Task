import 'dart:io';

import 'package:booking_app/core/constants/colors.dart';
import 'package:booking_app/features/auth/register/domain/entities/user_info_entity.dart';
import 'package:booking_app/features/auth/register/presentation/cubit/user_register_cubit.dart';
import 'package:booking_app/features/auth/widgets/google_button.dart';
import 'package:booking_app/features/auth/widgets/my_button.dart';
import 'package:booking_app/features/auth/widgets/my_text.dart';
import 'package:booking_app/features/auth/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/injection_container.dart' as di;

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<UserRegisterCubit>(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText(
                    text: "Sing up",
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(alignment: Alignment.center, child: MySignButton()),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: MyText(
                      text: "or log in with email",
                      fontSize: 20,
                      colors: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyText(
                      text: "First Name", fontSize: 20, colors: Colors.grey),
                  MyTextForm(
                    isDense: true,
                    radius: 50.0,
                    hintText: "Entre your Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Name';
                      } else {
                        return null;
                      }
                    },
                    textInputType: TextInputType.name,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const MyText(
                      text: "Last Name", fontSize: 20, colors: Colors.grey),
                  MyTextForm(
                    isDense: true,
                    radius: 50.0,
                    hintText: "Entre your Email",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const MyText(
                      text: "Your Email", fontSize: 20, colors: Colors.grey),
                  MyTextForm(
                    isDense: true,
                    radius: 50.0,
                    hintText: "Entre your Password",
                    textInputType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter your Password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const MyText(
                      text: "Password", fontSize: 20, colors: Colors.grey),
                  MyTextForm(
                    isDense: true,
                    radius: 50.0,
                    hintText: "Entre Password",
                    textInputType: TextInputType.visiblePassword,
                    controller: confirmPassController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          passwordController.text !=
                              confirmPassController.text) {
                        return "please Enter your confirm number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child:
                            BlocConsumer<UserRegisterCubit, UserRegisterState>(
                          listener: (BuildContext context, state) {},
                          builder: (BuildContext context, Object? state) {
                            var cubit = UserRegisterCubit.get(context);
                            if (state is! UserRegisterLoadingState) {
                              return MyButton(
                                label: "Sign Up",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                radius: 10,
                                onPressed: () {
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
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const MyText(
                        text:
                            "By Siging up , you agreed with our terms of Services and privacy policy.",
                        fontSize: 17,
                        colors: Colors.grey,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const MyText(
                            text: "Already have account?",
                            fontSize: 17,
                            colors: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
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
