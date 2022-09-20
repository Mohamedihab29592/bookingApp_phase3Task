import 'dart:async';
import 'package:booking_app/core/routes/routes_manager.dart';
import 'package:booking_app/core/utilis/constants/assets_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // var token = CacheHelper.getData(key: 'token');
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
    // if (token != null) {
    //   Navigator.pushReplacementNamed(
    //     context,
    //     Routes.mainRoute,
    //   );
    // } else {
    //   Navigator.pushReplacementNamed(
    //     context,
    //     Routes.loginRoute,
    //   );
    // }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
            image: AssetImage(
          ImageAssets.splash,
        ),
        fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
