import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel>? products;
  List<ProductModel>? filterProducts;
  List<int> genderFilter = [];
  String nameFilter = '';
  List<CategoryFilter> filters = [];

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/product'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)['product'] as List;
      products = jsonList.map((json) => ProductModel.fromJson(json)).toList();
      filterProducts = products;
    } else {
      throw Exception('Failed to load products');
    }
    notifyListeners();
  }

  void handleFilter() {
    filterProducts = filterName(products);
    filterProducts = filterGender(filterProducts);
    notifyListeners();
  }

  List<ProductModel>? filterName(List<ProductModel>? products) {
    if (nameFilter.isEmpty) {
      return products;
    } else {
      return products!
          .where((item) =>
              item.name.toLowerCase().contains(nameFilter.trim().toLowerCase()))
          .toList();
    }
  }

  List<ProductModel>? filterGender(List<ProductModel>? products) {
    if (genderFilter.isEmpty) {
      return products;
    } else {
      return products!
          .where((item) => genderFilter.contains(item.gender))
          .toList();
    }
  }

  void loadFilter() {
    filters = [
      CategoryFilter("Gender",
          [Option("Male", "Male", false), Option("Female", "Female", false)])
    ];
  }
}

class CategoryFilter {
  String title;
  List<Option> options;
  CategoryFilter(this.title, this.options);
  Widget toWidgetBody() {
    return Expanded(
        child: ListView(
            shrinkWrap: true,
            children: options.map((e) => e.toWidget()).toList()));
  }

  Map<String, dynamic> toMap() {
    return {"title": title, "body": toWidgetBody()};
  }
}

class Option {
  String label;
  String value;
  bool isChecked;
  Option(this.label, this.value, this.isChecked);
  Widget toWidget() {
    return ListTile(
      title: Text(label),
      trailing: Switch(
        value: isChecked,
        onChanged: (value) {
          isChecked = !isChecked;
          // print(reload);
        },
      ),
    );
  }
}
