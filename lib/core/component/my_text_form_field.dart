import 'package:flutter/material.dart';

import '../utilis/constants/colors.dart';

class MyTextForm extends StatelessWidget {
  final ValueChanged<String>? onChange;
  final String? hintText;
  final double? radius;
  final String? labelText;
  final FormFieldValidator? validator;
  final bool obscureText;
  final IconButton? prefixIcon;
  final IconData? suffixIcon;
  final bool? isDense;
  final Function(String)? onSubmit;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool isPassword;
  final VoidCallback? suffixIconPressed;
  final VoidCallback? prefixIconPressed;
  final VoidCallback? onTap;
  final bool readOnly;





  const MyTextForm({
    Key? key,
    this.hintText,
    this.isPassword = false,
    this.suffixIconPressed,
    required this.validator,
    this.onChange,
    this.onSubmit,
    this.radius ,
    required this.controller,
    this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    required this.textInputType,
    this.isDense,
    this.onTap,
    this.readOnly =false, this.prefixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(



        cursorColor: AppColors.grey,
      readOnly: readOnly,
      onFieldSubmitted: onSubmit,
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        hintStyle:  const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.grey
        ),
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.grey
        ),
        hintText: hintText,
        labelText: labelText,
        prefixIcon:  prefixIcon,
        suffixIcon: IconButton(onPressed: suffixIconPressed, icon: Icon(suffixIcon,color: AppColors.teal,),),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey,),
        ),
        focusedBorder:
    OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.blue,),

    )));
  }
}