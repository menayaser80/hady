// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lava/constants/theme_data.dart';
import 'package:lava/cubit/bloc%20observer.dart';
import 'package:lava/cubit/bloc.dart';
import 'package:lava/cubit/cashe%20helper.dart';
import 'package:lava/cubit/dio%20helper.dart';
import 'package:lava/provider/Car%20provider.dart';
import 'package:lava/provider/HomeAccprovider.dart';
import 'package:lava/provider/Order%20provider.dart';
import 'package:lava/provider/acc%20cart%20provider.dart';
import 'package:lava/provider/accsessory%20provider.dart';
import 'package:lava/provider/booking%20provider.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/chatprovider/chats_provider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/provider/theme_provider.dart';
import 'package:lava/provider/view%20provider.dart';
import 'package:lava/provider/wishlist_provider.dart';
import 'package:lava/view/home/Wishlist%20acc.dart';
import 'package:lava/view/home/viewed%20accessories.dart';
import 'package:lava/view/home/viewed_recently.dart';
import 'package:lava/view/home/wishlist.dart';
import 'package:lava/view/onboarding/get_started_page.dart';
import 'package:lava/view/store/details_accessories_screen.dart';
import 'package:lava/view/store/details_car_screen.dart';
import 'package:provider/provider.dart';

import 'provider/chatprovider/models_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () async {
      await CachHelper.init();
      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePreferences.getTheme();
  }
  final Future<FirebaseApp> firebaseinitilization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebaseinitilization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Text('An Error occured'),
                ),
              ),
            );
          }

          return MultiProvider(
            providers: [
              BlocProvider(create: (BuildContext context)=>NewsCubit()..getUserData(),
              ),
              ChangeNotifierProvider(create: (_) {
                //Notify about theme changes
                return themeChangeProvider;
              }),
              ChangeNotifierProvider(create: (_) {
                return PlaceProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return AccessoriesProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return Homecarprovider();
              }),
              ChangeNotifierProvider(create: (_) {
                return HomeAccprovider();
              }),
              ChangeNotifierProvider(create: (_) {
                return WishlistProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ViewedProdProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return TripProvider();
              }),
              ChangeNotifierProvider(
                create: (_) => ModelsProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => ChatProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => Bookingprovider(),
              ),
              ChangeNotifierProvider(
                create: (_) => Orderprovider(),
              ),
              ChangeNotifierProvider(
                create: (_) => Carteprovider(),
              ),


            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeChangeProvider, ch) {
                  return GetMaterialApp(

                    debugShowCheckedModeBanner: false,
                    title: 'Lava',
                    routes: {
                      DetailsCarScreen.routName: (context) =>
                      const DetailsCarScreen(),
                      DetailsAcessoriesScreen.routName: (context) =>
                      const DetailsAcessoriesScreen(),
                      ViewedRecentlyScreen.routName: (context) =>
                      const ViewedRecentlyScreen(),
                      Viewedaccscreen.routName: (context) =>
                      const Viewedaccscreen(),
                      WishlistScreen.routName: (context) => const WishlistScreen(),
                      WishlistAccscreen.routName: (context) => const WishlistAccscreen(),
                    },
                    theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
                    home: WelcomePage(),
                  );
                }),
          );
        });

  }
}
