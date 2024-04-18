
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/MyAppFunctions.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/provider/HomeAccprovider.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/view/store/details_car_screen.dart';
import 'package:lava/view/widget/Home/heart%20button.dart';
import 'package:lava/view/widget/read_more_and_less_widget.dart';
import 'package:provider/provider.dart';
class DetailsAcessoriesScreen extends StatefulWidget {
  static const routName = "/ProductttDetailsScreen";
  const DetailsAcessoriesScreen({super.key});

  @override
  State<DetailsAcessoriesScreen> createState() =>
      _DetailsAcessoriesScreenState();
}

class _DetailsAcessoriesScreenState extends State<DetailsAcessoriesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsProvider = Provider.of<HomeAccprovider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProdId(productId!);
    final cartProvider = Provider.of<TripProvider>(context);
    return Scaffold(
        body: getCurrProduct == null
            ? const SizedBox.shrink():SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 380,
                      decoration: BoxDecoration(
                        color: kWithOpsityGrey,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(
                                0, 5), // move the shadow below the container
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kWhiteColor,
                                ),
                                child: Center(
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                            Text(
                              getCurrProduct.name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'assets/images/icons8-share-50.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FancyShimmerImage(
                          imageUrl: getCurrProduct.Image,
                          height: size.height * 0.38,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 65,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  getCurrProduct.price,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(width: 4,),
                                Text(
                                  'L.E',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 29),
                                  child: HeartButtonWidget(
                                    bkgColor: Colors.blue.shade100,
                                    productId: getCurrProduct.Id,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          //NAME OF MODEL
                          getCurrProduct.model,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ReadMoreAndLessWidget(
                          text:getCurrProduct.description
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ColotCategory(),
                        CustomReveiw(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton.icon(

                            style: ElevatedButton.styleFrom(
                              backgroundColor:kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),

                            ),
                            onPressed: () async {
                              if (cartProvider.isProdinCart(
                                  productId:
                                  getCurrProduct.Id)) {
                                return;
                              }
                              try {
                                await cartProvider.addToCartFirebase(
                                    productId: getCurrProduct.Id,
                                    qty: 1,
                                    context: context);
                              } catch (e) {
                                await MyAppFunctions
                                    .showErrorOrWarningDialog(
                                  context: context,
                                  subtitle: e.toString(),
                                  fct: () {},
                                );
                              }
                            },
                            icon: Icon(
                              cartProvider.isProdinCart(
                                  productId:
                                  getCurrProduct.Id)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined,
                            ),
                            label: Text(cartProvider.isProdinCart(
                                productId: getCurrProduct.Id)
                                ? "In cart"
                                : "Add to cart",   style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
