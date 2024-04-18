import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lava/provider/booking%20provider.dart';
import 'package:lava/view/booking/Mainscreen/dry%20wash/drywashwidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';

class Mainenginewash extends StatefulWidget {
  const Mainenginewash({super.key});

  @override
  State<Mainenginewash> createState() => _MainenginewashState();
}

class _MainenginewashState extends State<Mainenginewash> {
  final bool isEmpty = true;
  bool isLoadingProd = true;

  Future<void> fetchFCT() async {
    final homecarprovider =
    Provider.of<Bookingprovider>(context, listen: false);
    try {
      Future.wait({
        homecarprovider.fetchenginewash(),
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
            Image.asset('assets/images/engine cleanning.jpeg',
            ),
            Text(
              'Empty Enginewash',
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
        title: TitlesTextWidget(label: "EngineWash"),
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
