// ignore_for_file: prefer_const_constructor, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/model/car_type.dart';
import 'package:lava/view/booking/engine%20wash/booking_page.dart';

import 'package:lava/view/widget/custom_text.dart';

import 'package:lava/view/widget/custom_textfield.dart';
import 'package:lava/view/widget/read_more_and_less_widget.dart';

class Enginewashpage extends StatefulWidget {
  const Enginewashpage({super.key});

  @override
  State<Enginewashpage> createState() => _ActionBookingPageState();
}

class _ActionBookingPageState extends State<Enginewashpage> {
  bool isShowMore = true;
  bool _timeSelected = false;
  int? _currentIndex;
  TextEditingController _modelController = TextEditingController();
  TextEditingController _PlateNumberController = TextEditingController();
  var selectedModelCar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Image.asset(
                'assets/images/engine cleanning.jpeg',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  CustomText(
                    text: 'Engine Wash',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReadMoreAndLessWidget(
                    text:
                        'The car is cleaned effectively without the need to use extensive water or strong chemical products.'
                        'Dry car wash technology relies on the use of special high-quality products and innovative techniques to remove dirt and impurities from the surface of the car in a safe and effective way.'
                        'Instead of using water, special sprays are used that contain cleaning and polishing ingredients that loosen and lift dirt from the surface.'
                        'What distinguishes is its effectiveness in cleaning the car and leaving it clean and shiny, while protecting the car\'s paint and preserving its quality and original color.',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Body Style',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: carTypeitem.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                  _timeSelected = true;
                                });
                              },
                              child: Container(
                                //height: 100,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? kPrimaryColor
                                      : kWithOpsityGrey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      carTypeitem[index].image,
                                      // 'assets/images/icons8-sport-car-64.png',
                                      width: 60,

                                      height: 60,
                                    ),
                                    CustomText(
                                      text: '${carTypeitem[index].name}',
                                      color: _currentIndex == index
                                          ? kWhiteColor
                                          : kBlackColor,

                                      //'Sendan',
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Car Details',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //drobdawon....
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: BoxDecoration(
                      color: kWithOpsityGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                      ),
                      dropdownColor: kWithOpsityGrey,
                      underline: Divider(
                        thickness: 0,
                        color: kWithOpsityGrey,
                      ),
                      isExpanded: true,
                      hint: CustomText(
                        text: 'Brand',
                        alignment: Alignment.centerLeft,

                        fontSize: 18,
                        // fontWeight: FontWeight.w600,
                      ),
                      items: [
                        'BMW',
                        'PEUGEOT',
                        'MERCEDES',
                      ]
                          .map((e) => DropdownMenuItem(
                                child: Text('$e'),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedModelCar = value!;
                        });
                      },
                      value: selectedModelCar,
                    ),
                  ),
                  // DropdownButton(
                  //   items: listItem.map((e) => DropdownMenuItem(value: valueItem,
                  //   child: ,)).toList(),
                  //   onChanged: (newValue) {
                  //     setState(() {
                  //       selectedModelCar = newValue;

                  //     });
                  //   },
                  //   value: selectedModelCar,
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Model',
                    controller: _modelController,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Plate Number',
                    controller: _PlateNumberController,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffEEEEEE),
        surfaceTintColor: Color(0xffEEEEEE),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomText(
                  text: ' 95',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: 'L.E',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Button(
              title: 'Next',
              disable: _timeSelected &&
                      (_PlateNumberController.text.isNotEmpty) &&
                      (_modelController.text.isNotEmpty) &&
                      (selectedModelCar != null && selectedModelCar.isNotEmpty)
                  ? false
                  : true,
              onPressed: () {
                Get.to(Engine(
                  carType: carTypeitem[_currentIndex!].name,
                  carDetails: selectedModelCar,
                  carModel:_modelController.text,
                  carPlateNumber: _PlateNumberController.text,
                  price:95,
                ));
              },
              // disable: true,
            )
          ],
        ),
      ),
    );
  }
}
