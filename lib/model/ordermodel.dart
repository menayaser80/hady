import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ordermodel with ChangeNotifier {
  final String Id,
      name,
      quantity,
      Image;
  double price;
  double totalPrice;
  Timestamp? createdAt;
  Ordermodel({
    required this.Id,
    required this.name,
    required this.totalPrice,
    required this.quantity,
    required this.price,
    required this.Image,
    this.createdAt,
  });

  factory Ordermodel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Ordermodel(
      Id: data["orderId"], //doc.get(field),
      name: data['productTitle'],
      totalPrice: data['totalPrice'],
      quantity: data['quantity'].toString(),
      price: data['price'],
      Image: data['imageUrl']??"https://www.shutterstock.com/image-vector/medicine-pharmacy-hospital-set-drugs-labels-646593400",
      createdAt: data['orderDate'],
    );
  }
}

//