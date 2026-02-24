import 'package:flutter/material.dart';
import 'package:flutter_new_project/providers/shopping_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Added Items")),
      body: Consumer<ShoppingProvider>(
        builder: (context, shoppingProvider, child) {
          if (shoppingProvider.cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }
          return ListView.builder(
            itemCount: shoppingProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = shoppingProvider.cartItems[index];
              return Card(
                child: ListTile(
                  leading: Image.network(item.image ?? "", height: 40),
                  title: Text(item.title ?? ""),
                  subtitle: Text("Price: ${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      shoppingProvider.removeFromCart(item);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
