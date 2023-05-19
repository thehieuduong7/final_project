import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel>? products;
  List<ProductModel>? filterProducts;
  String nameFilter = '';
  List<CategoryFilter> filters = [
    CategoryFilter(
        "Gender", [Option("Male", 1, false), Option("Female", 0, false)]),
    CategoryFilter("Category", [
      Option("NIKE", "NIKE", false),
      Option("ADIDAS", "ADIDAS", false),
      Option("Vans", "Vans", false),
    ])
  ];

  void setFilterCategory(String value) {
    CategoryFilter filter = filters[1];
    filter.options = filter.options.map((e) {
      e.isChecked = e.value == value;
      return e;
    }).toList();
  }

  void resetFilter() {
    filters.forEach((element) {
      element.options.forEach((e) {
        e.isChecked = false;
      });
    });
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/product'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)['product'] as List;
      products = jsonList.map((json) => ProductModel.fromJson(json)).toList();
      filterProducts = products;
      handleFilter();
    } else {
      throw Exception('Failed to load products');
    }
    // notifyListeners();
  }

  void handleFilter() {
    filterProducts = filterName(products);
    filterProducts = filterGender(filterProducts);
    filterProducts = filterCategory(filterProducts);
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
    CategoryFilter? filter = filters[0];
    List<int> filterList = filter.options
        .where((element) => element.isChecked == true)
        .map((e) => e.value as int)
        .toList();
    if (filterList.isEmpty) {
      return products;
    } else {
      return products!
          .where((item) => filterList.contains(item.gender))
          .toList();
    }
  }

  List<ProductModel>? filterCategory(List<ProductModel>? products) {
    CategoryFilter? filter = filters[1];
    List<String> filterList = filter.options
        .where((element) => element.isChecked == true)
        .map((e) => e.value as String)
        .toList();
    if (filterList.isEmpty) {
      return products;
    } else {
      return products!
          .where((item) => filterList.contains(item.brand))
          .toList();
    }
  }

  void loadFilter() {
    notifyListeners();
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
  dynamic label;
  dynamic value;
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
