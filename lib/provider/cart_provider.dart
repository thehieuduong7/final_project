import 'dart:convert';
import 'dart:ffi';

import 'package:final_project/provider/auth_provider.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  AuthProvider? _authProvider;

  CartProvider(this._authProvider);

  List<CartModel>? carts;

  Future<void> fetchCarts() async {
    String? _token = _authProvider?.getAccount()?.token;
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/cart'), headers: {
      'Authorization': 'Bearer $_token',
    });
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)['cartItems'] as List;
      carts = jsonList.map((json) => CartModel.fromJson(json)).toList();
    } else {
      carts = [];
      throw Exception('Failed to load cart');
    }
    notifyListeners();
  }

  Future<void> removeFromCart(String productId, int size) async {
    String? _token = _authProvider?.getAccount()?.token;
    final response = await http.delete(
        Uri.parse('http://10.0.2.2:8080/cart/$productId/$size'),
        headers: {
          'Authorization': 'Bearer $_token',
        });
    if (response.statusCode == 200) {
      await fetchCarts();
    } else {
      // throw Exception('Failed to load cart');
    }
    notifyListeners();
  }

  int getTotal() {
    if (carts == null) {
      return 0;
    }
    int sum = 0;
    carts?.forEach((element) {
      sum += (element.product?.price ?? 0) * (element.quantity ?? 0);
    });
    return sum;
  }

  List<CartModel>? getCarts() {
    return carts;
  }
}
