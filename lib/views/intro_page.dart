import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/custom_buttom.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                "Minimal Shop",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Premium Quality Products",
                style: TextStyle(
                    // color: Theme.of(context).colorScheme.inversePrimary,
                    ),
              ),
            ),
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
