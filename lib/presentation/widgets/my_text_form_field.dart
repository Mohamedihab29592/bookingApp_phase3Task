import 'package:flutter/material.dart';

class My_Text_Form extends StatelessWidget {
  final String hint;
  final double radius;

  const My_Text_Form({required this.hint, this.radius = 50});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
