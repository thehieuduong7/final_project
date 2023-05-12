import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel>? products;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/product'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)['product'] as List;
      products = jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
    notifyListeners();
  }
}
