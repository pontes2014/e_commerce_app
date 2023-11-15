import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:e_commerce_app/themes/light_mode.dart';
import 'package:e_commerce_app/views/cart_page.dart';
import 'package:e_commerce_app/views/intro_page.dart';
import 'package:e_commerce_app/views/shop_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: IntroPage(),
      ),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}
