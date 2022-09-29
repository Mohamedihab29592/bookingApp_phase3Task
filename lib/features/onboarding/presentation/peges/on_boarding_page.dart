import 'package:flutter/material.dart';
import '../../../../core/utilis/constants/colors.dart';

import '../widgets/on_boarding_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body:  OnBoardingWidget(),
      ),
    );
  }
}
