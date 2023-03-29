import 'package:final_project/components/products/product_card.dart';

import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductList extends StatefulWidget {
  List<Product> products;

  ProductList({Key? key, required this.products}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    bool isGridView = true;
    if (isGridView) {
      return LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) => ProductCard(
            // itemNo: index,
            product: widget.products[index],
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
            childAspectRatio: 1,
          ),
        );
      });
    } else {
      return ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              // itemNo: index,
              product: widget.products[index],
            );
          });
    }
  }
}
