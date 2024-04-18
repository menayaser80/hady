import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lava/provider/booking%20provider.dart';
import 'package:lava/view/booking/Mainscreen/dry%20wash/drywashwidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';

class Mainsteamwash extends StatefulWidget {
  const Mainsteamwash({super.key});

  @override
  State<Mainsteamwash> createState() => _MainsteamwashState();
}

class _MainsteamwashState extends State<Mainsteamwash> {
  final bool isEmpty = true;
  bool isLoadingProd = true;

  Future<void> fetchFCT() async {
    final homecarprovider =
    Provider.of<Bookingprovider>(context, listen: false);
    try {
      Future.wait({
        homecarprovider.fetchsteamwash(),
      });
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  void didChangeDependencies() {
    if (isLoadingProd) {
      fetchFCT();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<Bookingprovider>(context);
    return wishlistProvider.getProducts.isEmpty
        ? Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/steam wash.jpeg'),
            Text(
              'Empty Steamwash',
              style: TextStyle(
                  fontSize: 32,
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    )
        : Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitlesTextWidget(label: "SteamWash"),
      ),
      body: ListView.builder(
          itemBuilder: ( context,index){
            return ChangeNotifierProvider.value(
                value: wishlistProvider.getProducts[index],
                child: drywashwidget());
          },

          itemCount: wishlistProvider.getProducts.length),
    );
  }
}
