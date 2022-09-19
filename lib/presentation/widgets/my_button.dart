import 'package:booking_app/presentation/widgets/my_text.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Color backGroundColor;
  final Color textColor;
  final double radius;
  final double fontsize;
  final FontWeight fontWeight;
  MyButton({
    required this.label,
    this.backGroundColor = Colors.teal,
    this.textColor = Colors.white,
    required this.radius,
    required this.fontsize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
      style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
