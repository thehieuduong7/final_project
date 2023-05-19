import 'package:final_project/models/brand.dart';
import 'package:final_project/provider/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/product_provider.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Option> brands = [
      // Brand(name: "Adidas"),
      // Brand(name: "NIKE"),
      // Brand(name: "Vans"),
    ];
    return Consumer<ProductProvider>(builder: (context, productData, _) {
      brands = productData.filters[1].options;
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(
              title: "Special for you",
              press: () {},
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: brands
                    .map((e) => SpecialOfferCard(
                        category: e.label,
                        image: "assets/images/Image Banner 2.png",
                        press: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .setFilterCategory(e.value);
                          Provider.of<PageProvider>(context, listen: false)
                              .setIndex(1);
                        }))
                    .toList()),
          ),
        ],
      );
    });
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    // required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  // final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
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
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextSpan(text: "$numOfBrands Brands")
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
