
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lava/constants/assets_manager.dart';
import 'package:lava/constants/firebase%20constants.dart';
import 'package:lava/constants/global%20method.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/cubit/bloc.dart';
import 'package:lava/cubit/states.dart';
import 'package:lava/provider/theme_provider.dart';
import 'package:lava/view/Admin/Dashboard.dart';
import 'package:lava/view/auth/signIn_page.dart';
import 'package:lava/view/booking/Main%20Booking.dart';
import 'package:lava/view/home/Accessory%20cart.dart';
import 'package:lava/view/home/Wishlist%20acc.dart';
import 'package:lava/view/home/order/accorderscreen.dart';
import 'package:lava/view/home/order/orderScreen.dart';
import 'package:lava/view/home/viewed%20accessories.dart';
import 'package:lava/view/home/viewed_recently.dart';
import 'package:lava/view/home/wishlist.dart';
import 'package:lava/view/profile/my_booking_page.dart';
import 'package:lava/view/profile/personal_info_page.dart';
import 'package:lava/view/widget/Home/CustomListTile.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/widget/custom_backIcon_widget.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user=authInstance.currentUser;
  var emailcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themeState=Provider.of<ThemeProvider>(context);
    final Color color=themeState.getDarkTheme?Colors.white:Colors.black;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
    builder: (context,state){
      var usermodel=NewsCubit.get(context).usermodel;
return  Scaffold(
  appBar: AppBar(
    title: Text(
      'Profile',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: true,
    leading: BackIcon(),
  ),
  body: SizedBox(
    width: double.infinity,
    child:usermodel!=null? SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
      Stack(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage('${usermodel.image}'),
          ),
      
        ],
      ),
          SizedBox(
            height: 20,
          ),
          CustomText(
            text: '${usermodel.name}',
            alignment: Alignment.center,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            text:  '${usermodel.email}',
            alignment: Alignment.center,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            text:  '${usermodel.bio}',
            alignment: Alignment.center,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color:kGreyColor,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            text:  '${usermodel.phone}',
            alignment: Alignment.center,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: kGreyColor,
          ),
      
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(
              Icons.dashboard,
              color: Colors.green,
            ),
            title: const Text('Admin',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),),
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                        color: Colors.white.withOpacity(0.9),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.85,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Form(
                                key: formKey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 50,
                                      child: TextFormField(
                                          controller: emailcontroller,
                                          obscureText: true,
                                          validator: (v) {
                                            if (v.toString() != '123') {
                                              print("0");
                                            }
                                          },
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock),
                                            fillColor: Color(0xfff0d8fa),
                                            filled: true,
                                            labelText: 'LocK',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    12)),
                                          ),
                                          keyboardType:
                                          TextInputType.emailAddress,
                                          onChanged: (value) {
                                            print(value);
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () async {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20.0),
                                      color: const Color(0xffecf6ff),
                                    ),
                                    height: 40.0,
                                    width: 250.0,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              if(emailcontroller.text=='123')
                                              {
                                                navigateTo(context, DashboardScreen());
                                              }
                                              else
                                              {
                                                Fluttertoast.showToast(
                                                  msg: "Try Again",
                                                  toastLength: Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.grey.shade600,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );
                                              }
      
                                            }
                                          },
                                          child: Text(
                                            'Go To Dashboard',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          CustomListTile(
            listTileName: 'Personal Info',
            leadingIcon: Icon(Icons.person_2_outlined),
            onTap: () {
              navigateTo(context,EditProfile());
            },
          ),
          CustomListTile(
            listTileName: 'My Booking',
            leadingIcon: Icon(Icons.calendar_month_outlined),
            onTap: () {
navigateTo(context, MainBooking());
             // MyBookingPage
            },
          ),
          CustomListTile(
            listTileName: 'Privacy & Security',
            leadingIcon: Icon(Icons.privacy_tip_outlined),
            onTap: () {},
          ),
          CustomListTile(
            listTileName: 'Help Center',
            leadingIcon: Icon(Icons.help_center_outlined),
            onTap: () async{
      await launchUrl(Uri.parse("tel:+201020877952"));
            },
          ),

          CostomListTile(
            text: "Orders Cars",
            imagePath: AssetsManager.order,
            function: () {
navigateTo(context, OrdersScreenCars()) ;
},
          ),
          CostomListTile(
            text: "Orders Accessories",
            imagePath: AssetsManager.order,
            function: () {
              navigateTo(context, OrdersScreenAcc()) ;
            },
          ),

          CostomListTile(
            text: "Wishlist Cars",
            imagePath: AssetsManager.wishlistSvg,
            function: () {
              Navigator.pushNamed(context, WishlistScreen.routName);
            },
          ),
          CostomListTile(
            text: "Wishlist Accessories",
            imagePath: AssetsManager.wishlistSvg,
            function: () {
              Navigator.pushNamed(context, WishlistAccscreen.routName);
            },
          ),
          CostomListTile(
            text: "Viewed recently Car",
            imagePath: AssetsManager.recent,
            function: () {
              Navigator.pushNamed(
                  context, ViewedRecentlyScreen.routName);
            },
          ),
          CostomListTile(
            text: "Viewed recently Acc",
            imagePath: AssetsManager.recent,
            function: () {
              Navigator.pushNamed(
                  context, Viewedaccscreen.routName);
            },
          ),
          CostomListTile(
            text: "Accessories cart",
            imagePath: AssetsManager.orderBag,
            function: () {
              navigateTo(context, AcccartScreen());

            },
          ),

          listtile(
              title:user==null?'Login':'LogOut',
              icon:user==null?IconlyLight.login:IconlyLight.logout,
              color: color,
              onpressed: (){
                if(user==null)
                {
                  navigateTo(context, SignInPage());
                  return;
                }
                warningDialog(title: 'Sign out', subtitle: 'Do you want sign out?', fct:()async{
                  await authInstance.signOut();
                  navigateTo(context, SignInPage());
                }, context: context);
              }
          ),
        ],
      ),
    ):SizedBox(),
  ),
);
    },
    );


  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {super.key,
      required this.listTileName,
      required this.onTap,
      required this.leadingIcon});

  String listTileName;
  Function() onTap;
  Widget leadingIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            listTileName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          leading: leadingIcon,
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: onTap,
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: kGreyColor,
          endIndent: 30,
          indent: 30,
          height: 2,
        ),
      ],
    );
  }
}
