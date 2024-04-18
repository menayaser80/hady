// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/store/tracking_order_page.dart';
import 'package:lava/view/widget/custom_backIcon_widget.dart';
import 'package:lava/view/widget/custom_botton.dart';
import 'package:lava/view/widget/custom_textfield.dart';

import 'package:lottie/lottie.dart';

class SuccessfulOrderPage extends StatelessWidget {
  const SuccessfulOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: BackIcon(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // customContainer
                Column(
                  children: [
                    CustomSuccessfulContainer(),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Complete Your Data',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ComleteData(),
                  ],
                ),
                const SizedBox(height: 15),
                CustomButton(
                  buttomName: 'Tracking Order',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return TrackingOrderPage();
                    })));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSuccessfulContainer extends StatelessWidget {
  const CustomSuccessfulContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/08cc7bed-2fe5-4869-8a4d-ed04936d9634/k7di3xez9d.json',
              width: 75,
              height: 75,
            ),
            Text(
              'Successful order',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '12.000',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'L.E',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ComleteData extends StatelessWidget {
  const ComleteData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'name',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomTextField(
          hintText: 'Enter Full Name',
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Phone Number',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomTextField(
          hintText: 'Enter Your Phone Number',
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'City',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomTextField(
          hintText: 'Enter Your City',
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Address In Detail',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomTextField(
          hintText: 'Enter Your Address In Detail',
        ),
      ],
    );
  }
}
