import 'package:flutter/material.dart';
import 'package:e_commerce_app/components/custom_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            MyListTile(
                text: "Shop",
                icon: Icons.home,
                ontap: () => {
                      Navigator.pop(context),
                      Navigator.pushNamed(context, "/shop_page"),
                    }),
            MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                ontap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/cart_page");
                }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              ontap: () => Navigator.pushNamedAndRemoveUntil(
                  context, "/intro_page", (route) => false)),
        ),
      ]),
    );
  }
}
