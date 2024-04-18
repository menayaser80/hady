import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:lava/model/cart%20model.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/view/home/quantity_btm_sheet.dart';
import 'package:lava/view/widget/Home/heart%20button.dart';
import 'package:lava/view/widget/SubtitleTextWidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';
class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartModel = Provider.of<TripModel>(context);
    final productsProvider = Provider.of<Homecarprovider>(context);
    final getCurrProduct = productsProvider.findByProdId(cartModel.productId);
    final cartProvider = Provider.of<TripProvider>(context);
    return getCurrProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: TitlesTextWidget(
                            label: getCurrProduct.name,
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () async {
                                cartProvider.removeCartItemFromFirestore(
                                  cartId: cartModel.cartId,
                                  productId: getCurrProduct.Id,
                                  qty: cartModel.quantity,
                                );
                                // cartProvider.removeOneItem(
                                //   Id: getCurrProduct.Id,
                                // );
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            HeartButtonWidget(
                              productId: getCurrProduct.Id,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SubtitleTextWidget(
                          label: "${getCurrProduct.price}\$",
                          color: Colors.blue,
                        ),
                        const Spacer(),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor: Theme.of(context)
                                  .scaffoldBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return QuantityBottomSheetWidget(
                                  cartModel: cartModel,
                                );
                              },
                            );
                          },
                          icon: const Icon(IconlyLight.arrowDown2),
                          label: Text("Qty: ${cartModel.quantity}"),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
