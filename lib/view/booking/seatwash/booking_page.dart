// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:lava/constants/global%20method.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/home/payment_datails_page.dart';
import 'package:lava/view/widget/custom_backIcon_widget.dart';

import 'package:lava/view/widget/custom_textfield.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

class Seat extends StatefulWidget {
  const Seat(
      {super.key,
      required this.carType,
      required this.carDetails,
      required this.carModel,
      required this.carPlateNumber,
      required this.price,});

  final String carType;
  final String carDetails;
  final String carModel;
  final String carPlateNumber;
  final num price;

  @override
  State<Seat> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<Seat> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  bool _isButtonActive = true;
  bool _isLoading = false;
  String? currentTime;
  TextEditingController _placeController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Booking',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: BackIcon(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Select a day',
                    fontSize: 24,
                  ),

                  //display tabel calender here..
                  Container(color: kWithOpsityGrey, child: _tableCalendar()),

                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomText(
                      text: 'Choose a stating time',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: CustomText(
                      text:
                          'weekend is not avaliable, please select another date',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kGreyColor,
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            currentTime='${index + 9}:00 ${index + 9 > 11 ? 'Pm' : 'Am'}';
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index
                                ? kPrimaryColor
                                : kWithOpsityGrey,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 > 11 ? 'Pm' : 'Am'}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5),
                ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Place',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'Place Of Order',
                    controller: _placeController,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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
                Text(
                  ' 65',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text(
                  'L.E',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Button(
              title: 'Booking',
              disable: _timeSelected &&
                      _dateSelected &&
                      (_placeController.text.isNotEmpty)
                  ? false
                  : true,
              onPressed: () async {
                final userid = const Uuid().v4();
                    await FirebaseFirestore.instance
                        .collection("Seat Wash")
                        .doc(userid)
                        .set({
                      'userId': userid,
                 'car type':widget.carType,
                      "car details": widget.carDetails,
                      'price':widget.price,
                      'model':widget.carModel,
                      'plate number':widget.carPlateNumber,
                      'date':_currentDay,
                      'time': currentTime,
                      'place': _placeController.text,
                      'orderDate': Timestamp.now(),
                    }).then((value) {
                      navigateTo(context, HomePage());
                    });
                  }
                  )
          ],
        ),
      ),
    );
  }

  //table Calender
  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          //check if weekend is selected
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.disable});

  final String title;
  final bool disable; //this is used to disable button
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable ? null : onPressed,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: disable ? kGreyColor : kPrimaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
