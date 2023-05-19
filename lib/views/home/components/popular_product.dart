import 'package:final_project/components/products/product_list.dart';

// import 'package:final_project/models/product.dart';
import 'package:final_project/views/home/components/special_offers.dart';
import 'package:flutter/material.dart';

import '../../../components/products/product_card.dart';
import '../../../size_config.dart';
import '../../product_detail_page.dart';
import 'section_title.dart';
import 'package:provider/provider.dart';
import 'package:final_project/models/product_model.dart';
import 'package:final_project/provider/product_provider.dart';

// final List<Product> products = [
//   Product(
//       id: 1,
//       name: 'Champion',
//       image:
//           'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
//       price: 55.5),
//   Product(
//       id: 2,
//       name: 'Stark',
//       image:
//           'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1624&q=80',
//       price: 65.5),
//   Product(
//       id: 3,
//       name: 'Coloury',
//       image:
//           'https://images.unsplash.com/photo-1604671801908-6f0c6a092c05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
//       price: 75.5),
//   Product(
//       id: 4,
//       name: 'Pinky',
//       image:
//           'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
//       price: 87.5),
//   Product(
//       id: 5,
//       name: 'Power',
//       image:
//           'https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80',
//       price: 67.5),
// ];

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).resetFilter();

    Provider.of<ProductProvider>(context, listen: false).fetchProducts();

    return Consumer<ProductProvider>(builder: (context, productData, _) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(title: "Popular Products", press: () {}),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: (productData.filterProducts ?? [])
                    .map((e) => // Some height
                        SpecialProductCard(
                          product: e,
                          press: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ProductDetailPage(
                                    product: e,
                                  );
                                },
                              ),
                            )
                          },
                        ))
                    .toList()),
          )
        ],
      );
    });
  }
}

class SpecialProductCard extends StatelessWidget {
  const SpecialProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final ProductModel product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(150),
          height: getProportionateScreenWidth(150),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  product.product_image![0],
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "${product.name} \n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "${product.price} đồng")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
