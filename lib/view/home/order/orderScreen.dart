import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lava/constants/assets_manager.dart';
import 'package:lava/provider/Order%20provider.dart';
import 'package:lava/view/home/order/orderwidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';


class OrdersScreenCars extends StatefulWidget {

  const OrdersScreenCars({Key? key}) : super(key: key);

  @override
  State<OrdersScreenCars> createState() => _OrdersScreenCarsState();
}

class _OrdersScreenCarsState extends State<OrdersScreenCars> {
  final bool isEmpty = true;
  bool isLoadingProd = true;
  Future<void> fetchFCT() async {
    final homecarprovider =
    Provider.of<Orderprovider>(context, listen: false);
    try {
      Future.wait({
        homecarprovider.fetchProducts(),
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
    final wishlistProvider = Provider.of<Orderprovider>(context);

    return  wishlistProvider.getProducts.isEmpty
        ? Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.order),
            Text(
              'No orders has been placed yet',
              style: TextStyle(
                  fontSize: 32,
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ):
    Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TitlesTextWidget(label: "Orders Cars"),
        ),
        body: ListView.separated(
          itemCount: wishlistProvider.getProducts.length,
          itemBuilder: (ctx, index) {
            return  ChangeNotifierProvider.value(
                value: wishlistProvider.getProducts[index],
                child: OrdersWidgetFree());
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              // thickness: 8,
              // color: Colors.red,
            );
          },
        ));
  }
}
