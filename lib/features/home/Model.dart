import 'package:flutter/material.dart';

class Pet {
  String name;
  int age,id;
  double price;
  bool isSold = false;
  String imageUrl;
  String gender;
    Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.imageUrl,
    required this.gender,
  });

   Widget buildAdoptButton() {
    return ElevatedButton(
      onPressed: () {
        print('Adopting ${this.name}!');
      },
      child: Text('Adopt Me'),
    );
  }

}