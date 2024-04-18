// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/auth/register_page.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/widget/custom_botton.dart';
import 'package:lava/view/widget/custom_get_started_pages.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      CustomGetStartedPages(
                        title: 'Verification Code',
                        imageUrl: 'assets/images/undraw_verified_re_4io7 1.png',
                        subTitle: //remember but the number inside this text!!!!
                            'We have Sent  a Verification code on your phone Number +201023456789 .please Enterthe Verification code below .',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kBlackColor)),
                            ),
                            child: TextFormField(
                              onSaved: (pin1) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kBlackColor)),
                            ),
                            child: TextFormField(
                              onSaved: (pin2) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kBlackColor)),
                            ),
                            child: TextFormField(
                              onSaved: (pin3) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                              border: BorderDirectional(
                                  bottom: BorderSide(color: kBlackColor)),
                            ),
                            child: TextFormField(
                              onSaved: (pin4) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'if you  didn’t receive a code',
                      fontSize: 12,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: 'Resend',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff004269),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                CustomButton(
                  buttomName: 'Verify',
                  onTap: () {
                    Get.to(() => RegisterPage());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
