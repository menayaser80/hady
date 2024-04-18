import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lava/model/car%20model.dart';



class PlaceProvider with ChangeNotifier {
  List<Carmodel> products = [];

  List<Carmodel> get getProducts {
    return products;
  }

  Carmodel? findByProdId(String productId) {
    if (products
        .where((element) => element.Id == productId)
        .isEmpty) {
      return null;
    }
    return products.firstWhere((element) => element.Id == productId);
  }

  List<Carmodel> searchQuery(
      {required String searchText, required List<Carmodel> passedList}) {
    List<Carmodel> searchList = passedList
        .where(
          (element) =>
          element.name.toLowerCase().contains(
            searchText.toLowerCase(),
          ),
    )
        .toList();
    return searchList;
  }

  final productDb = FirebaseFirestore.instance.collection("Cars");

  Future<List<Carmodel>> fetchProducts() async {
    try {
      await productDb.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, Carmodel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Carmodel>> fetchProductsStream() {
    try {
      return productDb.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, Carmodel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
}