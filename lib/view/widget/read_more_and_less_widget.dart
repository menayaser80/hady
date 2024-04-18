// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';
import 'package:readmore/readmore.dart';

class ReadMoreAndLessWidget extends StatelessWidget {
  ReadMoreAndLessWidget({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      lessStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: kPrimaryColor),
      moreStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: kPrimaryColor),
      trimCollapsedText: 'See More',
      trimExpandedText: 'See Less',
      trimLines: 2,
      trimMode: TrimMode.Line,
    );
  }
}
