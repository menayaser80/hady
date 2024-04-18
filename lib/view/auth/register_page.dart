// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/custom_botton.dart';
import 'package:lava/view/widget/custom_Botton_social_medial.dart';
import 'package:lava/view/widget/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterPage> {
  bool isVisable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Complete!',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                labelText: 'E-Mail',
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  labelText: 'Password',
                  inputType: TextInputType.text,
                  obscureText: isVisable ? true : false,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisable = !isVisable;
                        });
                      },
                      icon: isVisable
                          ? Icon(Icons.visibility_off)
                          : Icon(
                              Icons.visibility,
                              color: kPrimaryColor,
                            ))),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  labelText: 'Confirm Password',
                  inputType: TextInputType.text,
                  obscureText: isVisable ? true : false,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisable = !isVisable;
                        });
                      },
                      icon: isVisable
                          ? Icon(Icons.visibility_off)
                          : Icon(
                              Icons.visibility,
                              color: kPrimaryColor,
                            ))),
              SizedBox(
                height: 100,
              ),
              CustomButton(
                buttomName: 'Sign Up',
                onTap: () {
                  Get.to(() => HomePage());
                },
              ),
              CustomBottonSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
