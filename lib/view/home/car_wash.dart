// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/booking/drywash/about_car_wash.dart';
import 'package:lava/view/booking/engine%20wash/about_car_wash.dart';
import 'package:lava/view/booking/polish%20serface/about_car_wash.dart';
import 'package:lava/view/booking/seatwash/about_car_wash.dart';
import 'package:lava/view/booking/steam%20wash/about_car_wash.dart';

import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/home/search_screen.dart';

import 'package:lava/view/widget/search_texr_field.dart';

import '../booking/foam wash/about_car_wash.dart';

class CarWashScreen extends StatelessWidget {
  const CarWashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        scrolledUnderElevation: 0,
        title: InkWell(
            onTap: () {
              showSearch(context: context, delegate: DataSearch());
            },
            child: SearchTextField(
              enabled: false,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text: 'Special For You',
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              'assets/images/Frame 34032.png',
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/Frame 34033.png',
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/Frame 34031.png'),
            SizedBox(
              height: 15,
            ),
            CustomText(
              text: 'Car Wash',
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 250,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWithOpsityGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/ddd.jpeg',
                                  //  'assets/images/Frame 34031.png',
                                  width: 200,
                                  height: 140,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomText(
                                        text: 'Dry Wash',
                                        //text: 'Dry Wash',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomText(
                                        text: '50 L.E',
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Drywashpage(),
                                         );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kPrimaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: CustomText(
                                            text: 'Booking',
                                            color: kWhiteColor,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWithOpsityGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/steam wash.jpeg',
                                  //  'assets/images/Frame 34031.png',
                                  width: 200,
                                  height: 140,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomText(
                                        text: 'Steam Wash',
                                        //text: 'Dry Wash',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomText(
                                        text: '70 L.E',
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Staemwashpage(),);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kPrimaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: CustomText(
                                            text: 'Booking',
                                            color: kWhiteColor,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWithOpsityGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/foam cleanning.jpeg',
                                  //  'assets/images/Frame 34031.png',
                                  width: 200,
                                  height: 140,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomText(
                                        text: 'Foam Wash',
                                        //text: 'Dry Wash',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomText(
                                        text: '65 L.E',
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Foamwashpage(),);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kPrimaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: CustomText(
                                            text: 'Booking',
                                            color: kWhiteColor,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWithOpsityGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/polising cleanning.jpeg',
                                  //  'assets/images/Frame 34031.png',
                                  width: 200,
                                  height: 140,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomText(
                                        text: 'Polish serface',
                                        //text: 'Dry Wash',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomText(
                                        text: '90 L.E',
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Polishpage(), );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kPrimaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: CustomText(
                                            text: 'Booking',
                                            color: kWhiteColor,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWithOpsityGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/engine cleanning.jpeg',
                                  //  'assets/images/Frame 34031.png',
                                  width: 200,
                                  height: 140,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomText(
                                        text: 'Engine Wash',
                                        //text: 'Dry Wash',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: CustomText(
                                        text: '95 L.E',
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Enginewashpage(),);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kPrimaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: CustomText(
                                            text: 'Booking',
                                            color: kWhiteColor,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kWithOpsityGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/seats cleanning.jpeg',
                                  //  'assets/images/Frame 34031.png',
                                  width: 200,
                                  height: 140,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomText(
                                        text: 'Seats Wash',
                                        //text: 'Dry Wash',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex:2,
                                      child: CustomText(
                                        text: '65 L.E',
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Seatwashpage(),
                                      );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: kPrimaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: CustomText(
                                            text: 'Booking',
                                            color: kWhiteColor,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              
                ],
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
