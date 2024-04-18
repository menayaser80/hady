// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:lava/constatnt.dart';
import 'package:lava/view/home/payment_datails_page.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter/material.dart';
import 'package:lava/view/widget/custom_backIcon_widget.dart';

class TrackingOrderPage extends StatelessWidget {
  const TrackingOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Payment Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: BackIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //timeline tile here ..
            Column(
              children: [
                CustomOrdetTrackerContainer(),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Data',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CostomRowDetails(
                  title: 'Name: ',
                  tilteValue: 'Abdelrahman Osama',
                ),
                SizedBox(
                  height: 10,
                ),
                CostomRowDetails(
                  title: 'Phone Number : ',
                  tilteValue: '+201123456789',
                ),
                SizedBox(
                  height: 10,
                ),
                CostomRowDetails(
                  title: 'City : ',
                  tilteValue: 'Tanta',
                ),
                SizedBox(
                  height: 10,
                ),
                CostomRowDetails(
                  title: 'Address : ',
                  tilteValue: 'elbaher street',
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

class CustomOrdetTrackerContainer extends StatelessWidget {
  const CustomOrdetTrackerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWithOpsityGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomTimeLineWidget(
              isDone: true,
              isFirst: true,
              isLast: false,
              endChild: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'In Transit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Parcel has been delivered',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
              ),
            ),
            CustomTimeLineWidget(
              isDone: true,
              isFirst: false,
              isLast: false,
              endChild: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Departed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'The parcels left the company',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
              ),
            ),
            CustomTimeLineWidget(
              isDone: true,
              isFirst: false,
              isLast: false,
              endChild: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Order Preparing',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'The order is prepared for receip',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
              ),
            ),
            CustomTimeLineWidget(
              isDone: true,
              isFirst: false,
              isLast: true,
              endChild: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Accepted',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Your request has been approved',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CostomRowDetails extends StatelessWidget {
  CostomRowDetails({super.key, required this.title, required this.tilteValue});
  String title;
  String tilteValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          tilteValue,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class CustomTimeLineWidget extends StatelessWidget {
  CustomTimeLineWidget({
    super.key,
    required this.endChild,
    required this.isFirst,
    required this.isLast,
    required this.isDone,
  });
  bool isFirst;
  bool isLast;
  Widget endChild;
  bool isDone;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        endChild: endChild,
        beforeLineStyle: LineStyle(
          color: kGreyColor,
          thickness: 2,
        ),
        indicatorStyle: IndicatorStyle(
          iconStyle: IconStyle(iconData: Icons.check, color: kWhiteColor),
          width: 30,
          height: 30,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
