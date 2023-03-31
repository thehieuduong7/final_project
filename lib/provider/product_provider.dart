import 'package:final_project/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<Product>? products;
  Future<void> getProduct() async {
    try {
      var url = Uri.parse('http://127.0.0.1:8080/product?page=2&pageSize=1');
      final http.Response response = await http.get(url);
      print(response.body);
    } on Exception catch (_) {
      print(_);
    }
    notifyListeners();
  }
}
