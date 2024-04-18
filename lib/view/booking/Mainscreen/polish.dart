import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lava/provider/booking%20provider.dart';
import 'package:lava/view/booking/Mainscreen/dry%20wash/drywashwidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';

class Mainpolishwash extends StatefulWidget {
  const Mainpolishwash({super.key});

  @override
  State<Mainpolishwash> createState() => _MainpolishwashState();
}

class _MainpolishwashState extends State<Mainpolishwash> {
  final bool isEmpty = true;
  bool isLoadingProd = true;

  Future<void> fetchFCT() async {
    final homecarprovider =
    Provider.of<Bookingprovider>(context, listen: false);
    try {
      Future.wait({
        homecarprovider.fetchpolishwash(),
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
            Image.asset('assets/images/polising cleanning.jpeg'),
            Text(
              'Empty Polishwash',
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
        title: TitlesTextWidget(label: "PolishWash"),
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
