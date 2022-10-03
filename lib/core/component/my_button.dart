import 'package:flutter/material.dart';

import '../utilis/constants/values_manger.dart';

class MyButton extends StatelessWidget {
  final String label;
  final double width;
  final Color backGroundColor;
  final Color textColor;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;

  const MyButton({
    super.key,
    required this.label,
    this.backGroundColor = Colors.teal,
    this.textColor = Colors.white,
    required this.radius,
    required this.fontSize,
    required this.fontWeight,
    required this.onPressed, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s50,
      width: width,
      child: ElevatedButton(

          onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,

            foregroundColor: textColor,
            padding: const EdgeInsets.all(AppPadding.p10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppPadding.p30),
            ),

        ),
        child: Text(label,style:
            TextStyle(fontSize: fontSize,))),
    );
  }
}
