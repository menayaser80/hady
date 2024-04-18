
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lava/constants/global%20method.dart';

import 'package:lava/constatnt.dart';
import 'package:lava/cubit/bloc.dart';
import 'package:lava/cubit/states.dart';
import 'package:lava/provider/HomeAccprovider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/view/home/search%20accessories.dart';
import 'package:lava/view/home/search%20car.dart';
import 'package:lava/view/store/store_page.dart';

import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/home/car_wash.dart';
import 'package:lava/view/live_shat/chat_page.dart';
import 'package:lava/view/store/empty_cart_page.dart';

import 'package:lava/view/profile/profile_page.dart';
import 'package:lava/view/home/search_screen.dart';
import 'package:lava/view/widget/custom_accessories_card.dart';
import 'package:lava/view/widget/custom_car_card.dart';
import 'package:lava/view/widget/search_texr_field.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static List names = [
    'hady',
    'mohamed',
    'wael',
    'abdo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      bottomNavigationBar: BottomAppBar(
        color: kWithOpsityGrey,
        surfaceTintColor: kWithOpsityGrey,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CustomNavBar(
                image: 'assets/images/icons8-home-48.png',
                labelName: 'Home',
                //onTap: () {},
              ),
            ),
            Expanded(
              child: CustomNavBar(
                image: 'assets/images/icons8-chat-50 (1).png',
                labelName: 'Booking',
                onTap: () {
                  navigateTo(context, CarWashScreen());
                },
              ),
            ),
            Expanded(
              child: CustomNavBar(
                onTap: () {
                  navigateTo(context, ChatScreen());
                  },
                image: 'assets/images/icons8-chat-50 (1).png',
                labelName: 'Chat',
              ),
            ),
            Expanded(
              child: CustomNavBar(
                image: 'assets/images/icons8-cart-64.png',
                labelName: 'Cart',
                onTap: () {
                  navigateTo(context, CartScreen());
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  static List offers = [
    'assets/images/Frame 34032.png',
    'assets/images/Frame 34033.png',
    'assets/images/Frame 34031.png'
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoadingProd = true;
  Future<void> fetchFCT() async {
    final homecarprovider =
    Provider.of<Homecarprovider>(context, listen: false);
    final homeAccprovider =
    Provider.of<HomeAccprovider>(context, listen: false);
    try {
      Future.wait({
        homecarprovider.fetchProducts(),
        homeAccprovider.fetchProducts(),
      });
    } catch (error) {
      log(error.toString());
    }
  }
  @override
  void didChangeDependencies() {
    if (isLoadingProd) {
      fetchFCT();
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final homecarprovider = Provider.of<Homecarprovider>(context);
    final homeaccprovider = Provider.of<HomeAccprovider>(context);

    Size size = MediaQuery.of(context).size;
    return BlocConsumer<NewsCubit,NewsStates>(
        listener:(context,state){} ,
    builder: (context,state){
      var usermodel=NewsCubit.get(context).usermodel;
          return usermodel!=null? Scaffold(
            backgroundColor: kWhiteColor,
            appBar: AppBar(
              backgroundColor: kWhiteColor,
              scrolledUnderElevation: 0,
              leading: InkWell(
                onTap: (){
                  navigateTo(context, ProfilePage());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image(
                    image: NetworkImage('${usermodel.image}',
                    ),
                  ),
                ),
              ),
              title: InkWell(
                  onTap: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  child: SearchTextField(
                    enabled: false,
                  )),
              actions: [
                Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          //     Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          //   return ();
                          // })));
                        },
                        icon: Icon(
                          FontAwesomeIcons.bell,
                          size: 25,
                        )),
                    Positioned(
                      top: 12,
                      right: 13,
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kRedColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Special For You',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(CarWashScreen());
                          },
                          child: CustomText(
                            text: 'See More',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Home.offers.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    Home.offers[index],
                                    width: 300,
                                  ),
                                ));
                          },
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: 'Services',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomServises(),
                    SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      visible: homecarprovider.getProducts.isNotEmpty,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitlesTextWidget(label: "Cars"),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: (){
                                navigateTo(context, StorePage());
                              },
                              child:Text(
                                'See More',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kPrimaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: homecarprovider.getProducts.isNotEmpty,
                      child: SizedBox(
                        height: size.height * 0.2,
                        child: ListView.separated(
                            separatorBuilder: (context, index)=> SizedBox(width: 10,),
                            scrollDirection: Axis.horizontal,

                            itemCount: homecarprovider.getProducts.length < 10
                                ? homecarprovider.getProducts.length
                                : 10,
                            itemBuilder: (context, index) {
                              return ChangeNotifierProvider.value(
                                  value: homecarprovider.getProducts[index],
                                  child: const CustomCarCard(

                                  ));
                            }),
                      ),
                    ),

                    SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: homeaccprovider.getProducts.isNotEmpty,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitlesTextWidget(label: "Accessories"),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: (){
                                navigateTo(context, StorePage());
                              },
                              child:Text(
                                'See More',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kPrimaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: homeaccprovider.getProducts.isNotEmpty,
                      child: SizedBox(
                        height: size.height * 0.2,
                        child: ListView.separated(
                            separatorBuilder: (context, index)=> SizedBox(width: 10,),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeaccprovider.getProducts.length < 10
                                ? homeaccprovider.getProducts.length
                                : 10,
                            itemBuilder: (context, index) {
                              return ChangeNotifierProvider.value(
                                  value: homeaccprovider.getProducts[index],
                                  child: const CustomAccessoriesCard());
                            }),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ):SizedBox();
    },
    );
  }
}

class CustomServises extends StatelessWidget {
  const CustomServises({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/carwash.png',
              width: 100,
              height: 100,
            ),
            CustomText(
              text: 'Car Wash',
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/car1.jpeg',
              width: 100,
              height: 100,
            ),
            CustomText(
              text: 'Car ',
            ),
          ],
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/accessories.jpeg',
              width: 100,
              height: 100,
            ),
            CustomText(
              text: 'Accessories',
            ),
          ],
        ),
      ],
    );
  }
}

class CustomRowInHomePage extends StatelessWidget {
  CustomRowInHomePage(
      {super.key,
      required this.titleName,
      this.onPressed,
      this.textButtonName});
  String titleName;
  String? textButtonName;

  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              textButtonName ?? '',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
            ))
      ],
    );
  }
}

class CustomNavBar extends StatelessWidget {
  CustomNavBar({
    super.key,
    required this.image,
    required this.labelName,
    this.onTap,
  });
  String image;

  String labelName;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Expanded(
            child: Text(
              labelName,
              style: TextStyle(color: kPrimaryColor, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
