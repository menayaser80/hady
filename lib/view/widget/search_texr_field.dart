// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
    this.enabled,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.suffixIcon,
    this.onTapSuffixIcon,
  });

  final bool? enabled;
  Function(String)? onChanged;
  Function()? onEditingComplete;
  TextEditingController? controller;
  IconData? suffixIcon;
  VoidCallback? onTapSuffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        fillColor: kWithOpsityGrey,
        border: InputBorder.none,
        filled: true,
        enabled: enabled ?? false,
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            size: 20,
          ),
          onPressed: onTapSuffixIcon,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: kBlackColor,
        ),
        contentPadding: EdgeInsets.all(8),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
