import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/MyAppFunctions.dart';
import 'package:lava/constants/assets_manager.dart';
import 'package:lava/provider/HomeAccprovider.dart';
import 'package:lava/provider/wishlist_provider.dart';
import 'package:lava/view/widget/Home/Accwidget2.dart';
import 'package:lava/view/widget/Home/empty%20bag.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';



class WishlistAccscreen extends StatefulWidget {
  static const routName = "/WishlistaccScreen";
  const WishlistAccscreen({super.key});

  @override
  State<WishlistAccscreen> createState() => _WishlistAccscreenState();
}

class _WishlistAccscreenState extends State<WishlistAccscreen> {
  final bool isEmpty = true;
  bool isLoadingProd = true;
  Future<void> fetchFCT() async {
    final homecarprovider =
    Provider.of<HomeAccprovider>(context, listen: false);
    final wishlistsProvider =
    Provider.of<WishlistProvider>(context, listen: false);
    try {
      Future.wait({

        homecarprovider.fetchProducts(),
        wishlistsProvider.fetchWishlist(),
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
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlists.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.bagWish,
        title: "Nothing in ur wishlist yet",
        subtitle:
        "Looks like your cart is empty add something and make me happy",
        buttonText: "Prefer Place Now",
      ),
    )
        : Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.wishlistSvg,
          ),
        ),
        title: TitlesTextWidget(
            label: "Favourite Accessories"),
        actions: [
          IconButton(
            onPressed: () {
              MyAppFunctions.showErrorOrWarningDialog(
                isError: false,
                context: context,
                subtitle: "Clear Wishlist?",
                fct: () async {
                  await wishlistProvider.clearWishlistFromFirebase();
                  wishlistProvider.clearLocalWishlist();
                },
              );
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: DynamicHeightGridView(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        builder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ACCWidget2(
              productId: wishlistProvider.getWishlists.values
                  .toList()[index]
                  .productId,
            ),
          );
        },
        itemCount: wishlistProvider.getWishlists.length,
        crossAxisCount: 2,
      ),
    );
  }
}