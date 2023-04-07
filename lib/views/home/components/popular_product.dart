import 'package:final_project/components/products/product_list.dart';
import 'package:final_project/models/product.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';

final List<Product> products = [
  Product(
      id: 1,
      name: 'Champion',
      image:
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      price: 55.5),
  Product(
      id: 2,
      name: 'Stark',
      image:
          'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1624&q=80',
      price: 65.5),
  Product(
      id: 3,
      name: 'Coloury',
      image:
          'https://images.unsplash.com/photo-1604671801908-6f0c6a092c05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 75.5),
  Product(
      id: 4,
      name: 'Pinky',
      image:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      price: 87.5),
  Product(
      id: 5,
      name: 'Power',
      image:
          'https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80',
      price: 67.5),
];

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // ProductList(
              //   products: products,
              //   isGridView: true,
              // ),
            ],
          ),
        )
      ],
    );
  }
}
