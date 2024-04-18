// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/model/car%20model.dart';
import 'package:lava/provider/view%20provider.dart';
import 'package:lava/view/store/details_accessories_screen.dart';
import 'package:provider/provider.dart';

class CustomAccessoriesCard extends StatefulWidget {
  const CustomAccessoriesCard({super.key});

  @override
  State<CustomAccessoriesCard> createState() => _CustomAccessoriesCardState();
}

class _CustomAccessoriesCardState extends State<CustomAccessoriesCard> {
  @override
  Widget build(BuildContext context) {
    final productsModel = Provider.of<Carmodel>(context);
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return InkWell(
      onTap: () async {
        viewedProdProvider.addViewedProd(productId: productsModel.Id);
        await Navigator.pushNamed(context, DetailsAcessoriesScreen.routName,
            arguments: productsModel.Id);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        // width: 160,
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
              flex: 3,
              child:    ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FancyShimmerImage(
                  imageUrl:  productsModel.Image,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: kGreyColor.withOpacity(0.1),
                  //color: kWithOpsityGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         productsModel.name,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${productsModel.price} L.E',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
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
