import 'package:flutter/material.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/view/widget/SubtitleTextWidget.dart';
import 'package:lava/view/widget/title%20widget.dart';

import 'package:provider/provider.dart';


class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key, required this.function});
  final Function function;
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Homecarprovider>(context);
    final cartProvider = Provider.of<TripProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: TitlesTextWidget(
                            label:
                            "Total (${cartProvider.getCartitems.length} Cars/${cartProvider.getQty()} items)")),
                    SubtitleTextWidget(
                      label:
                      "${cartProvider.getTotal(productsProvider: productsProvider).toStringAsFixed(2)}\$",
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await function();
                },
                child: const Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}