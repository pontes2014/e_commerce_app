import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/custom_buttom.dart';
import 'package:e_commerce_app/components/custom_drawer.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          // botão de cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          // botão de remover
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('yes'),
          )
        ],
      ),
    );
  }

  // user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  'User wants to pay! Connect this app to your payment backend'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart Page'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        //cart list
        Expanded(
          child: cart.isEmpty
              ? const Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))
              : ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //get individual item in cart
                    final item = cart[index];

                    // return as a cart tile UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: Icon(Icons.remove)),
                    );
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: MyButton(
            onTap: () => payButtonPressed(context),
            child: Text('Pay now'),
          ),
        )
      ]),
    );
  }
}
