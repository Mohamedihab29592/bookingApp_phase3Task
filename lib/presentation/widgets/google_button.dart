import 'package:flutter/material.dart';

class MySignButton extends StatelessWidget {
  // final String label;
  // final Color backGroundColor;
  // final Color textColor;
  // final double radius;
  // final double fontsize;
  // final FontWeight fontWeight;
  // MySignButton({
  //   required this.label,
  //   required this.backGroundColor,
  //   required this.textColor,
  //   required this.radius,
  //   required this.fontsize,
  //   required this.fontWeight,
  // });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset("assets/images/google.jpg"),
      label: Text("Google"),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
