// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.labelText,
      this.inputType,
      this.onChanged,
      this.suffixIcon,
      this.prefixWidget,
      this.hintText,
        this.validator,
      this.controller,
      this.obscureText = false});
  Function(String)? onChanged;
   String? Function(String?val)?validator;

  String? labelText;
  String? hintText;

  TextInputType? inputType;
  bool? obscureText;
  Widget? suffixIcon;
  Widget? prefixWidget;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      onChanged: onChanged,
      keyboardType: inputType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: suffixIcon,

        hintText: hintText,
        hintStyle: TextStyle(color: kGreyColor, fontSize: 14),
        prefix: prefixWidget,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        contentPadding: EdgeInsets.all(16),

        fillColor: Color(0xffF8F8F8),
        // Color(0xffF8F8F8),
        filled: true,
        /* */ enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        /* */ border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(10),
        ),
        /* */ focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: kWhiteColor, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
