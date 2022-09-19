import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
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
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      child: Text(label),
    );
  }
}
