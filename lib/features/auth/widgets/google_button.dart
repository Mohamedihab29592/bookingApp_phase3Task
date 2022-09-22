import 'package:flutter/material.dart';

import '../../../core/utilis/constants/app_strings.dart';
import '../../../core/utilis/constants/assets_manager.dart';
import '../../../core/utilis/constants/colors.dart';
import '../../../core/utilis/constants/values_manger.dart';


class MySignButton extends StatelessWidget {
  const MySignButton({super.key});



  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},

      icon: Image.asset(ImageAssets.google,height: AppSize.s20,),
      label: const Text(AppStrings.google),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGrey,
          foregroundColor: AppColors.white,
          padding:const EdgeInsets.all(AppPadding.p14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s30),
          ),
          textStyle: const TextStyle(fontSize: AppSize.s20, fontWeight: FontWeight.bold)),
    );
  }
}
