import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/MyAppFunctions.dart';
import 'package:lava/provider/HomeAccprovider.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/provider/view%20provider.dart';
import 'package:lava/view/store/details_accessories_screen.dart';
import 'package:lava/view/store/details_car_screen.dart';
import 'package:lava/view/widget/Home/heart%20button.dart';
import 'package:lava/view/widget/SubtitleTextWidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';
class ACCWidget2 extends StatefulWidget {
  const ACCWidget2({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  State<ACCWidget2> createState() => _ACCWidget2State();
}

class _ACCWidget2State extends State<ACCWidget2> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<HomeAccprovider>(context);
    final getCurrProduct = productsProvider.findByProdId(widget.productId);
    Size size = MediaQuery.of(context).size;
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    final cartProvider = Provider.of<TripProvider>(context);

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () async {
          viewedProdProvider.addViewedProd(
              productId: getCurrProduct.Id);
          await Navigator.pushNamed(
            context,
            DetailsAcessoriesScreen.routName,
            arguments: getCurrProduct.Id,
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: getCurrProduct.Image,
                height: size.height * 0.22,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: TitlesTextWidget(
                      label: getCurrProduct.name,
                      fontSize: 18,
                      maxLines: 2,
                    ),
                  ),Spacer(),
                  Flexible(
                    flex: 2,
                    child: HeartButtonWidget(
                      productId: getCurrProduct.Id,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () async {
                        if (cartProvider.isProdinCart(
                            productId: getCurrProduct.Id)) {
                          return;
                        }
                        try {
                          await cartProvider.addToCartFirebase(
                              productId: getCurrProduct.Id,
                              qty: 1,
                              context: context);
                        } catch (e) {
                          await MyAppFunctions.showErrorOrWarningDialog(
                            context: context,
                            subtitle: e.toString(),
                            fct: () {},
                          );
                        }

                      },
                      splashColor: Colors.red,
                      child: Icon(
                        cartProvider.isProdinCart(
                            productId: getCurrProduct.Id)
                            ? Icons.check
                            : Icons.shopping_cart_outlined,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(

                children: [
                  Flexible(
                    flex: 1,
                    child: SubtitleTextWidget(
                      label: getCurrProduct.description,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(

                children: [
                  Flexible(
                    flex: 1,
                    child: SubtitleTextWidget(
                      label:getCurrProduct.model,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}