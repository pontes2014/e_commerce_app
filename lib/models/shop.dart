import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'product 1',
      description: 'Item description...',
      price: 99.99,
      imagePath: 'assets/images/vaso.jpg'
    ),
    Product(
      name: 'product 2',
      description: 'Item description...',
      price: 99.99,
      imagePath: 'assets/images/sofa.jpg'
    ),
    Product(
      name: 'product 3',
      description: 'Item description...',
      price: 99.99,
      imagePath: 'assets/images/cadeira.jpg'
    ),
    Product(
      name: 'product 4',
      description: 'Item description...',
      price: 99.99,
      imagePath: 'assets/images/xicara.jpg'
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addTocart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
