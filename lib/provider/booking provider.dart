import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lava/model/book%20model.dart';
class Bookingprovider with ChangeNotifier {
  List<bookModel> products = [];

  List<bookModel> get getProducts {
    return products;
  }

  bookModel? findByProdId(String productId) {
    if (products
        .where((element) => element.Id == productId)
        .isEmpty) {
      return null;
    }
    return products.firstWhere((element) => element.Id == productId);
  }

  final productDry = FirebaseFirestore.instance.collection("Dry wash");

  Future<List<bookModel>> fetchdrywash() async {
    try {
      await productDry.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<bookModel>> fetchdrywashStream() {
    try {
      return productDry.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
  final productsteam = FirebaseFirestore.instance.collection("Steam wash");

  Future<List<bookModel>> fetchsteamwash() async {
    try {
      await productsteam.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<bookModel>> fetchsteamwashStream() {
    try {
      return productsteam.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
  final productengine = FirebaseFirestore.instance.collection("Engine wash");

  Future<List<bookModel>> fetchenginewash() async {
    try {
      await productengine.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<bookModel>> fetchenginewashStream() {
    try {
      return productengine.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
  final productfoam = FirebaseFirestore.instance.collection("Foam wash");

  Future<List<bookModel>> fetchfoamwash() async {
    try {
      await productfoam.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<bookModel>> fetchfoamwashStream() {
    try {
      return productfoam.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
  final polishservice = FirebaseFirestore.instance.collection("Polish wash");
  Future<List<bookModel>> fetchpolishwash() async {
    try {
      await polishservice.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }
  Stream<List<bookModel>> fetchpolishwashStream() {
    try {
      return polishservice.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
  final seatservice = FirebaseFirestore.instance.collection("Seat Wash");
  Future<List<bookModel>> fetchseatwash() async {
    try {
      await seatservice.get().then((productSnapshot) {
        products.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return products;
    } catch (e) {
      rethrow;
    }
  }
  Stream<List<bookModel>> fetchseatwashStream() {
    try {
      return seatservice.snapshots().map((snapshot) {
        products.clear();
        // products = []
        for (var element in snapshot.docs) {
          products.insert(0, bookModel.fromFirestore(element));
        }
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }
}