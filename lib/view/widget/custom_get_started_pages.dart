// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';

// ignore: must_be_immutable
class CustomGetStartedPages extends StatelessWidget {
  CustomGetStartedPages(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.subTitle});
  String title;
  String imageUrl;
  String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: kBlackColor, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset(imageUrl),
          SizedBox(
            height: 30,
          ),
          Text(
            subTitle,
            style: TextStyle(
                fontSize: 12, color: kBlackColor, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
