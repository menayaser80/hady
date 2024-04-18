import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/model/cart%20model.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/view/widget/Home/heart%20button.dart';
import 'package:provider/provider.dart';

class Cartywidget extends StatelessWidget {
  const Cartywidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartModel = Provider.of<TripModel>(context);
    final productsProvider = Provider.of<Homecarprovider>(context);
    final getCurrProduct = productsProvider.findByProdId(cartModel.productId);
    final cartProvider = Provider.of<TripProvider>(context);
    return  getCurrProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
    child: IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.Image,
                      height: size.height * 0.2,
                      width: size.height * 0.2,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IntrinsicWidth(
                    child:Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Column(
                                  children: [
                                    Text( getCurrProduct.name),
                                    HeartButtonWidget(
                                      productId: getCurrProduct.Id,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () async{
    cartProvider.removeCartItemFromFirestore(
    cartId: cartModel.cartId,
    productId: getCurrProduct.Id,
    qty: cartModel.quantity,
    );
    }, icon: Icon(Icons.delete)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(getCurrProduct.price),
                            Text(getCurrProduct.model),
                          ],
                        ),
                      ],
                    ) ,
                  ),

                ],
              ),
            ),
          ],
        ),
      ) ,
    ),
    );
  }
}