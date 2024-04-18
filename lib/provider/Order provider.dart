import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lava/model/ordermodel.dart';



class Orderprovider with ChangeNotifier {
  List<Ordermodel> products = [];

  List<Ordermodel> get getProducts {
    return products;
  }

  Ordermodel? findByProdId(String productId) {
    if (products
        .where((element) => element.Id == productId)
        .isEmpty) {
      return null;
    }
    return products.firstWhere((element) => element.Id == productId);
  }

  List<Ordermodel> searchQuery(
      {required String searchText, required List<Ordermodel> passedList}) {
    List<Ordermodel> searchList = passedList
        .where(
          (element) =>
          element.name.toLowerCase().contains(
            searchText.toLowerCase(),
          ),
    )
        .toList();
    return searchList;
  }

  final productDb = FirebaseFirestore.instance.collection("orders cars");

  Future<List<Ordermodel>> fetchProducts() async {
    try {
      await productDb.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, Ordermodel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Ordermodel>> fetchProductsStream() {
    try {
      return productDb.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, Ordermodel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
  final productsss = FirebaseFirestore.instance.collection("orders Accessories");

  Future<List<Ordermodel>> fetchacc() async {
    try {
      await productsss.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, Ordermodel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Ordermodel>> fetchaccStream() {
    try {
      return productsss.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, Ordermodel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }

}