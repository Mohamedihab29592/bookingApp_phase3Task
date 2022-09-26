import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color colors;
  final FontWeight fontWeight;

  const MyText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.colors = Colors.white,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: colors,
        fontWeight: fontWeight,
      ),
    );
  }
}
