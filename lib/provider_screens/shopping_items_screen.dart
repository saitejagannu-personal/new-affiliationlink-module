import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_project/api/models/shopping_model.dart';
import 'package:flutter_new_project/cart_screen.dart';
import 'package:flutter_new_project/providers/shopping_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ShoppingItemsScreen extends StatefulWidget {
  const ShoppingItemsScreen({super.key});

  @override
  State<ShoppingItemsScreen> createState() => _ShoppingItemsScreenState();
}

class _ShoppingItemsScreenState extends State<ShoppingItemsScreen> {
  late ShoppingProvider shoppingProvider;

  @override
  void initState() {
    shoppingProvider = Provider.of<ShoppingProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      shoppingProvider.getShoppingItems();
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
     print("Shopping screen built");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Shopping"),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(CartScreen());
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.black,),
              ),
              Positioned(
                right: 0,
                child: Consumer<ShoppingProvider>(
                  builder: (context , ShoppingProvider , child) {
                    return CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 8,
                      child: Text("${ShoppingProvider.cartItems.length}", style:  TextStyle( fontSize: 11, fontWeight: FontWeight.bold)),
                     
                    );
                  }
                ),
              )
            ],
          ),
          SizedBox( width: 30,)
        ],
      ),
      body: Consumer<ShoppingProvider>(
        builder: (context, shoppingProvider, child) {
          // return Center(
          //   child: Text(
          //     shoppingProvider.count.toString(),
          //     style: TextStyle(color: Colors.black, fontSize: 30),
          //   ),
          // );
          return ListView.builder(
            itemCount: shoppingProvider.ShoppingModelList.length,
            itemBuilder: (context, index) {
              ShoppingModel shoppingModel =
                  shoppingProvider.ShoppingModelList[index];
              return Card(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: shoppingModel.image ?? "",
                      height: 100,
                    ),
                    ListTile(
                      trailing: InkWell(
                        onTap: () {
                          
                          if (shoppingProvider.isProductAdded(shoppingModel)) {
                            shoppingProvider.removeFromCart(shoppingModel);
                          } else {
                            shoppingProvider.addToCart(shoppingModel);
                          }
                          
                        },
                        
                        child: shoppingProvider.isProductAdded(shoppingModel)
                        ? Text("Remove from cart")
                        : Text("Add to cart")
                        ),
                      title: Text(shoppingModel.title ?? ""),
                      subtitle: Text(
                        "price ${shoppingModel.price}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          shoppingProvider.increaseCount(); // example usage
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
