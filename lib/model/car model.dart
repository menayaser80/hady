import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Carmodel with ChangeNotifier {
  final String Id,
      name,
      model,
      description,
      price,
      Image;
      Timestamp? createdAt;
  Carmodel({
    required this.Id,
    required this.name,
    required this.model,
    required this.description,
    required this.price,
    required this.Image,
    this.createdAt,
  });

  factory Carmodel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Carmodel(
      Id: data["ModelId"], //doc.get(field),
      name: data['carTitle'],
      model: data['model'],
      description: data['description'],
      price: data['price'],
      Image: data['Image']??"https://www.shutterstock.com/image-vector/medicine-pharmacy-hospital-set-drugs-labels-646593400",
      createdAt: data['createdAt'],
    );
  }
}

//