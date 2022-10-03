import 'package:flutter/material.dart';

import '../widgets/onBoarddingWidgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const OnBoardingWidget(),
    );
  }
}