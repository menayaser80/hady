import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/global%20method.dart';
import 'package:lava/view/booking/Mainscreen/dry%20wash/drywash%20screen.dart';
import 'package:lava/view/booking/Mainscreen/engine.dart';
import 'package:lava/view/booking/Mainscreen/foamwash.dart';
import 'package:lava/view/booking/Mainscreen/polish.dart';
import 'package:lava/view/booking/Mainscreen/seat.dart';
import 'package:lava/view/booking/Mainscreen/steamwash.dart';
import 'package:lava/view/widget/title%20widget.dart';

class MainBooking extends StatelessWidget {
  const MainBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitlesTextWidget(label: "MainBooking Screen "),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  navigateTo(context, Maindrywash());
                },
                child: Column(
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
                    Center(
                      child: Text(
                        'Dry Wash',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  navigateTo(context, Mainsteamwash());

                },
                child: Column(
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
                    Center(
                      child: Text(
                        'Steam Wash',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, Mainfoamwash());

                },
                child: Column(
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
                    Center(
                      child: Text(
                        'Foam Wash',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
navigateTo(context, Mainpolishwash());
                },
                child: Column(
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
                    Center(
                      child: Text(
                        'Polish serface',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, Mainenginewash());
                },
                child: Column(
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
                    Center(
                      child: Text(
                        'Engine Wash',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, Mainseatwash());
                },
                child: Column(
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
                    Center(
                      child: Text(
                        'Seat Wash',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
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
    );
  }
}
