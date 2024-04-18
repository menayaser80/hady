import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/model/ordermodel.dart';
import 'package:lava/provider/Order%20provider.dart';
import 'package:lava/view/widget/SubtitleTextWidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';


class OrdersWidgetFree extends StatefulWidget {
  const OrdersWidgetFree({super.key});

  @override
  State<OrdersWidgetFree> createState() => _OrdersWidgetFreeState();
}

class _OrdersWidgetFreeState extends State<OrdersWidgetFree> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<Ordermodel>(context);
    final productsProvider = Provider.of<Orderprovider>(context);
    final getCurrProduct = productsProvider.findByProdId(cartModel.Id);
    final size = MediaQuery.of(context).size;
    return getCurrProduct == null
        ? const SizedBox.shrink() :  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: size.width * 0.25,
              width: size.width * 0.25,
              imageUrl: getCurrProduct.Image,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Flexible(
                        child: Text(
                          maxLines: 2,
                          getCurrProduct.name,style: TextStyle(
                          fontSize: 15,
                        ),

                        ),
                      ),

                    ],
                  ),
                   Row(
                    children: [
                      TitlesTextWidget(
                        label: 'Price:  ',
                        fontSize: 15,
                      ),
                      Flexible(
                        child: SubtitleTextWidget(
                          label: "${getCurrProduct.price} \$",
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   SubtitleTextWidget(
                    label:getCurrProduct.quantity ,
                    fontSize: 15,
                  ),
                  const SizedBox(
                    height: 5,
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
