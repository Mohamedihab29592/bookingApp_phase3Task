// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:booking_app/core/constants/colors.dart';
import 'package:booking_app/presentation/widgets/google_button.dart';
import 'package:booking_app/presentation/widgets/my_button.dart';
import 'package:booking_app/presentation/widgets/my_text.dart';
import 'package:booking_app/presentation/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Sing up",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 30,
              ),
              Align(alignment: Alignment.center, child: MySignButton()),
              SizedBox(
                height: 30,
              ),
              Center(
                child: MyText(
                  text: "or log in with email",
                  fontSize: 20,
                  colors: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyText(text: "First Name", fontSize: 20, colors: Colors.grey),
              My_Text_Form(
                hint: "Entre your First Name",
              ),
              SizedBox(
                height: 15,
              ),
              MyText(text: "Last Name", fontSize: 20, colors: Colors.grey),
              My_Text_Form(
                hint: "Entre your Last Name",
              ),
              SizedBox(
                height: 15,
              ),
              MyText(text: "Your Email", fontSize: 20, colors: Colors.grey),
              My_Text_Form(
                hint: "Entre your Email",
              ),
              SizedBox(
                height: 15,
              ),
              MyText(text: "Password", fontSize: 20, colors: Colors.grey),
              My_Text_Form(
                hint: "Entre Password",
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: MyButton(
                      label: "Sing Up",
                      fontWeight: FontWeight.bold,
                      fontsize: 20,
                      radius: 15,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyText(
                    text:
                        "By Siging up , you agreed with our terms of Services and privacy policy.",
                    fontSize: 17,
                    colors: Colors.grey,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      MyText(
                        text: "Already have account?",
                        fontSize: 17,
                        colors: Colors.grey,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
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
    );
  }
}
