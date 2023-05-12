import 'package:final_project/components/products/product_card.dart';
import 'package:final_project/models/product_model.dart';

import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  List<ProductModel>? products;
  bool isGridView;
  ProductList({Key? key, required this.products, this.isGridView = true})
      : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    if (widget.products == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (widget.isGridView) {
      return LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          itemCount: widget.products?.length ?? 0,
          itemBuilder: (context, index) => ProductCard(
            // itemNo: index,
            product: widget.products![index],
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
            childAspectRatio: 1,
          ),
        );
      });
    } else {
      return ListView.builder(
          itemCount: widget.products?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              // itemNo: index,
              product: widget.products![index],
            );
          });
    }
  }
}
