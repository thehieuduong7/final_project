import 'package:flutter/material.dart';

import '../../models/cart_model.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
        Text(
          "${demoCarts.length} items",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    ),
  );
}
