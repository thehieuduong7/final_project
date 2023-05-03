import 'dart:convert';

import 'package:final_project/provider/auth_provider.dart';
import 'package:final_project/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';
import '../../../size_config.dart';
import 'cart_card.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Provider.of<CartProvider>(context, listen: false).fetchCarts();

    return Consumer<CartProvider>(builder: (context, cartData, _) {
      if (cartData.carts == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        List<CartModel>? data = cartData.carts
            ?.where((element) => (element.product != null))
            .toList();
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key("1"),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  CartModel cart = data[index];
                  Provider.of<CartProvider>(context, listen: false)
                      .removeFromCart(cart.product?.id ?? '', cart.size ?? 0);
                  // setState(() {
                  //   data!.removeAt(index);
                  // });
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: CartCard(cart: data![index]),
              ),
            ),
          ),
        );
      }
    });
  }
}
