import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/model/car%20model.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/view%20provider.dart';
import 'package:lava/view/store/details_car_screen.dart';

import 'package:provider/provider.dart';

class CustomCarCard extends StatefulWidget {
  const CustomCarCard({
    super.key,
  });


  @override
  State<CustomCarCard> createState() => _CustomCarCardState();
}

class _CustomCarCardState extends State<CustomCarCard> {
  @override
  Widget build(BuildContext context) {
    final productsModel = Provider.of<Carmodel>(context);
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return
    InkWell(
      onTap: () async {
        viewedProdProvider.addViewedProd(productId: productsModel.Id);
        await Navigator.pushNamed(context, DetailsCarScreen.routName,
            arguments: productsModel.Id);
      },
      child: Container(

        width: 160,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: kGreyColor.withOpacity(.9),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(6, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
           child:    ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FancyShimmerImage(
                  imageUrl:  productsModel.Image,
             boxFit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
              // color: kWithOpsityGrey,
              color: kGreyColor.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        productsModel.name,
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),

                    Expanded(
                      child: Text(
                         productsModel.description,
                        style:
                            TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Expanded(

                      child: Text(
                         productsModel.model,
                        style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '\$ ${ productsModel.price}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
