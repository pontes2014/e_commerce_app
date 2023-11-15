import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/custom_drawer.dart';
import 'package:e_commerce_app/components/custom_product_tile.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Center(
            child: Text(
              "pick from a selected list of premim products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];

                return MyProductTile(
                  product: product,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
