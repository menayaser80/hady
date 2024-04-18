// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/MyAppFunctions.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/view/widget/Home/heart%20button.dart';


import 'package:lava/view/widget/read_more_and_less_widget.dart';
import 'package:provider/provider.dart';

class DetailsCarScreen extends StatefulWidget {
  static const routName = "/ProductDetailsScreen";
  const DetailsCarScreen({super.key});

  @override
  State<DetailsCarScreen> createState() => _DetailsCarScreenState();
}

class _DetailsCarScreenState extends State<DetailsCarScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsProvider = Provider.of<Homecarprovider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProdId(productId!);
    final cartProvider = Provider.of<TripProvider>(context);
    return Scaffold(
        body: getCurrProduct == null
            ? const SizedBox.shrink(): SafeArea(
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
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, bottom: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$${getCurrProduct.price}',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.w600),
                                ),
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
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          //NAME OF MODEL
                          '${getCurrProduct.model}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ReadMoreAndLessWidget(
                          text:'${getCurrProduct.description}'
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CategoryCarsDetails(),
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

class CategoryCarsDetails extends StatelessWidget {
  const CategoryCarsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomContainerForCategoryCarsDetails(
            image: 'assets/images/icons8-engine-50.png',
            secText1: '1598',
            secText2: 'Cm3',
            thirdText: 'Engine',
          ),
        ),
        Expanded(
          child: CustomContainerForCategoryCarsDetails(
            image: 'assets/images/icons8-power-26.png',
            secText1: '116',
            thirdText: 'Power',
          ),
        ),
        Expanded(
          child: CustomContainerForCategoryCarsDetails(
            image: 'assets/images/icons8-speed-50.png',
            secText1: '117',
            thirdText: 'Speed',
          ),
        ),
        Expanded(
          child: CustomContainerForCategoryCarsDetails(
            image: 'assets/images/icons8-car-50.png',
            secText1: 'Sedan',
            thirdText: 'Tc',
          ),
        ),
      ],
    );
  }
}

class CustomContainerForCategoryCarsDetails extends StatelessWidget {
  CustomContainerForCategoryCarsDetails({
    super.key,
    required this.image,
    required this.secText1,
    this.secText2,
    required this.thirdText,
  });
  String image;
  String secText1;
  String? secText2;
  String thirdText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: kWithOpsityGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 30,
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: secText1,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    if (secText2 != null)
                      TextSpan(
                        text: secText2,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                thirdText,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColotCategory extends StatelessWidget {
  const ColotCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: kWithOpsityGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kBlackColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kBlueDarkColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomReveiw extends StatelessWidget {
  const CustomReveiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: kWithOpsityGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Reviewes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '4.0',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.star,
                      size: 26,
                      color: kGreyColor,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Based On 608 rating and 95 reviewes',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: kGreyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
