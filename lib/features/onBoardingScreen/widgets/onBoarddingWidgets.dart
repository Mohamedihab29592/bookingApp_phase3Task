import 'package:booking_app/core/app_localization/app_localization.dart';
import 'package:booking_app/core/component/my_button.dart';
import 'package:booking_app/features/onBoardingScreen/widgets/pageViewSection.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/routes_manager.dart';
import '../../../core/utilis/constants/app_strings.dart';
import '../../../core/utilis/constants/colors.dart';
import '../../../core/utilis/constants/values_manger.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        const Expanded(
          child: SizedBox(
              width: double.infinity,
              child: PageViewSection()),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              MyButton(
                width: double.infinity,

                onPressed: () {
                  Navigator.pushNamed(context,Routes.loginRoute);
                },
                label: AppStrings.logIn.tr(context),
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s18,
                radius: AppPadding.p12,
              ),
              const SizedBox(
                height: 15,
              ),
              MyButton(
                width: double.infinity,

                onPressed: () {
                  Navigator.pushNamed(context,Routes.registerRoute);
                },
                label: AppStrings.signUp.tr(context),
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s18,
                radius: AppPadding.p12,
                backGroundColor: AppColors.grey,
              ),
            ],
          ),
        ),
      ],
    ),);
  }
}
