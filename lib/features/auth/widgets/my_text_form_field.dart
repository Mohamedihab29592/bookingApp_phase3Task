import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  final ValueChanged<String>? onChange;
  final String? hintText;
  final double? radius;
  final String? labelText;
  final FormFieldValidator? validator;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final bool? isDense;
  final Function(String)? onSubmit;
  final TextInputType textInputType;
  final TextEditingController controller;

  const MyTextForm({
    Key? key,
    this.hintText,
    required this.validator,
    this.onChange,
    this.onSubmit,
    this.radius,
    required this.controller,
    this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixPressed,
    this.suffixIcon,
    required this.textInputType,
    this.isDense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmit,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
        IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon)),
        isDense: isDense,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.black),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
