// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/widget/custom_backIcon_widget.dart';

import 'package:lottie/lottie.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPage();
}

class _PaymentDetailsPage extends State<PaymentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: CustomText(
          text: 'Payment Details',
          fontSize: 24,
        ),
        centerTitle: true,
        leading: BackIcon(),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 15),
        //symmetric(vertical: 60, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  // height: 490,
                  decoration: BoxDecoration(
                    color: kWithOpsityGrey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: kGreyColor.withOpacity(.9),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(6, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Payment Total',
                          alignment: Alignment.center,
                          fontSize: 20,
                          color: kGreyColor,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '62',
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                            CustomText(
                              text: 'L.E',
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ),
                        CustomRow(
                          title: 'Date',
                          result1: 'Jan 01,2024 |',
                          result2: '08:00 AM',
                        ),
                        CustomRow(
                          title: 'Details',
                          result1: 'Dry Clean',
                        ),
                        CustomRow(
                          title: 'Service Duration',
                          result1: '1.5 H',
                        ),
                        Container(
                          width: 290,
                          height: 1,
                          color: kGreyColor,
                        ),
                        CustomRow(
                          title: 'Total Payment',
                          result1: '50.00',
                          result2: 'L.E',
                        ),
                        CustomRow(
                          title: 'Tax',
                          result1: '12.00',
                          result2: 'L.E',
                        ),
                        CustomRow(
                          title: 'Total',
                          result1: '62.00',
                          result2: 'L.E',
                        ),
                        CustomRow(
                          title: 'Payment Methods',
                          result1: 'Cash',
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -80,
                  left: 50,
                  right: 50,
                  child: Lottie.network(
                    'https://lottie.host/1380f182-99b7-4624-a3bb-4cbb082626af/lA2kVLWV4i.json',
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
            CustomButtonDetails(),
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  CustomRow(
      {super.key, required this.result1, required this.title, this.result2});
  String title;
  String result1;
  String? result2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: kGreyColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: result1,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              CustomText(
                text: result2 ?? '',
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButtonDetails extends StatelessWidget {
  const CustomButtonDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return HomePage();
        })));
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Back To Home',
              alignment: Alignment.center,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/icons8-reply-arrow-32.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
