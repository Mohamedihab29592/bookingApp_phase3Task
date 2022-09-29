import 'package:booking_app/core/utilis/constants/colors.dart';
import 'package:flutter/material.dart';

import 'on_board_model.dart';

class BuildOnBoardingItem extends StatelessWidget {
  final OnBoardModel model;

  const BuildOnBoardingItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              model.image,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          model.body,
          maxLines: 4,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
