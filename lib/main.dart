import 'package:booking_app/presentation/register/screen/sign_up_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MotelApp());
}

class MotelApp extends StatelessWidget {
  const MotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
