// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lava/constants/global%20method.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/onboarding/onbording.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Image.asset('assets/images/logo1-removebg-preview 1.png'),
          Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'Fast',
              ),
              SizedBox(
                width: 2,
              ),
              CustomText(
                  text: 'Car Wash',
                  color: Color(0xff004269),
                  fontWeight: FontWeight.w700),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
            navigateTo(context, OnboardingPages());
            },
            child: Container(
              width: 240,
              height: 58,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get started ',
                    style: TextStyle(color: kWhiteColor, fontSize: 22),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: kWhiteColor,
                    size: 27,
                  ),
                ],
              )),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
