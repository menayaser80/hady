import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/MyAppFunctions.dart';
import 'package:lava/constants/assets_manager.dart';
import 'package:lava/constants/loading%20manager.dart';
import 'package:lava/provider/cart%20provider.dart';
import 'package:lava/provider/homecarprovider.dart';
import 'package:lava/provider/wishlist_provider.dart';
import 'package:lava/view/home/bottom_checkout.dart';
import 'package:lava/view/widget/Home/cartwidget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final bool isEmpty = true;
  bool isLoadingProd = true;
  Future<void> fetchFCT() async {
    final homecarprovider =
    Provider.of<Homecarprovider>(context, listen: false);
    final wishlistsProvider =
    Provider.of<WishlistProvider>(context, listen: false);
    final cartProvider =
    Provider.of<TripProvider>(context, listen: false);
    try {
      Future.wait({
        homecarprovider.fetchProducts(),
        wishlistsProvider.fetchWishlist(),
        cartProvider.fetchCart(),
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
  bool _isLoading = false;
  var database=FirebaseFirestore.instance.collection("users");
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // final productsProvider = Provider.of<ProductsProvider>(context);
    final productsProvider =
    Provider.of<Homecarprovider>(context, listen: false);
    final cartProvider = Provider.of<TripProvider>(context);

    return cartProvider.getCartitems.isEmpty
        ? Scaffold(
      body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/9005646-removebg-preview 1.png'),
          Text(
            'Empty Cart',
            style: TextStyle(
                fontSize: 32,
                color: Color(0xff999999),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    )
        : Scaffold(
        bottomSheet: CartBottomSheetWidget(function: () async {
      final auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user == null) {
        return;
      }
      final uid = user.uid;
      try {
        setState(() {
          _isLoading = true;
        });
        cartProvider.getCartitems.forEach((key, value) async {
          final getCurrProduct = productsProvider.findByProdId(value.productId);
          final orderId = const Uuid().v4();
          await FirebaseFirestore.instance
              .collection("orders cars")
              .doc(orderId)
              .set({
            'orderId': orderId,
            'userId': uid,
            'productId': value.productId,
            "productTitle": getCurrProduct!.name,
            'price': double.parse(getCurrProduct.price) * value.quantity,
            'totalPrice':
            cartProvider.getTotal(productsProvider: productsProvider),
            'quantity': value.quantity,
            'imageUrl': getCurrProduct.Image,
            'orderDate': Timestamp.now(),
          });
        });
        await cartProvider.clearCartFromFirebase();
        cartProvider.clearLocalCart();
      } catch (e) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: e.toString(),
          fct: () {},
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
    ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: TitlesTextWidget(
            label: "Cart Car "),
        actions: [
          IconButton(
            onPressed: () {
              MyAppFunctions.showErrorOrWarningDialog(
                isError: false,
                context: context,
                subtitle: "Clear cart?",
                fct: () async {
                  cartProvider.clearCartFromFirebase();
                  // cartProvider.clearLocalCart();
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

      body: LoadingManager(
        isLoading: _isLoading,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartProvider.getCartitems.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: cartProvider.getCartitems.values
                            .toList()[index],
                        child: const CartWidget());
                  }),
            ),
            const SizedBox(
              height: kBottomNavigationBarHeight + 10,
            )
          ],
        ),
      ),
    );
  }


}