import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bookModel with ChangeNotifier {
  final String Id;
  final String details;
  final String type;
  final String time;
final DateTime date;
  final num price;
  Timestamp? createdAt;
  bookModel({
    required this.Id,
    required this.details,
    required this.time,
    required this.type,
    required this.date,
    required this.price,
    this.createdAt,
  });

  factory bookModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return bookModel(
      Id: data["userId"], //doc.get(field),
      time: data['time'],
      price: data['price'],
      date: DateTime.fromMillisecondsSinceEpoch((data['date']as Timestamp).millisecondsSinceEpoch),
      type:data['car type'],
      details:data['car details'],
      createdAt: data['orderDate'],
    );
  }
}

//احلي كيمو تسلم يحتة