import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_new_project/api/models/shopping_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ShoppingProvider extends ChangeNotifier {
  int count = 0;
  List<ShoppingModel> ShoppingModelList = [];
  List<ShoppingModel> cartItems = [];

  increaseCount() {
    count++;
    print("count $count");
    notifyListeners();
  }

  Future<void> getShoppingItems() async {
    try {
      final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"),
      );
      if (response.statusCode == 200) {
        ShoppingModelList = (jsonDecode(response.body) as List)
            .map((e) => ShoppingModel.fromJson(e))
            .toList();
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    }
    notifyListeners();
  }

  dynamic addToCart(ShoppingModel shoppingModel) {
    cartItems.add(shoppingModel);
    Fluttertoast.showToast(msg: "added to cart");
    notifyListeners();
  }

  bool isProductAdded(ShoppingModel shoppingModel) {
    return cartItems.any((element) => element.id == shoppingModel.id);
  }

  void removeFromCart(ShoppingModel shoppingModel) {
    cartItems.removeWhere((element) => element.id == shoppingModel.id);
    Fluttertoast.showToast(msg: "Removed from cart");
    notifyListeners();
  }
}
