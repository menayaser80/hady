// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    // required this.message,
  });
  // final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/images/Vector.png')),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                color: Color(0xffEEEEEE),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Text(
              'Hello! Can I help You? ',
              // message.message,
              style: TextStyle(color: kBlackColor),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubleForClient extends StatelessWidget {
  const ChatBubleForClient({
    super.key,
    // required this.message,
  });
  //final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        child: Text(
          'Yes Please ',
          //  message.message,
          style: TextStyle(color: kBlackColor),
        ),
      ),
    );
  }
}
