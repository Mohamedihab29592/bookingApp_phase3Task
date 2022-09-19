import 'package:booking_app/features/auth/register/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MotelApp());
}

class MotelApp extends StatelessWidget {
  const MotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
