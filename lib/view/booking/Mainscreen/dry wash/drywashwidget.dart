// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/model/book%20model.dart';
import 'package:lava/provider/booking%20provider.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/widget/custom_backIcon_widget.dart';
import 'package:provider/provider.dart';

class drywashwidget extends StatelessWidget {
  const drywashwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<bookModel>(context);
    final productsProvider = Provider.of<Bookingprovider>(context);
    final getCurrProduct = productsProvider.findByProdId(cartModel.Id);
    return getCurrProduct == null
        ? const SizedBox.shrink() : Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: kWithOpsityGrey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: kGreyColor.withOpacity(.9),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getCurrProduct.type,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${getCurrProduct.price}\$',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getCurrProduct.details,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.end,
                        children: [
                          Text(
                            getCurrProduct.time,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                           '${ DateFormat.yMMMMEEEEd().format(getCurrProduct.date)}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
