// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';

class CustomCirvleAvatar extends StatelessWidget {
  const CustomCirvleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Stack(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/images/Mask group2.png'),
        ),
        Positioned(
          bottom: 0,
          right: 30,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
