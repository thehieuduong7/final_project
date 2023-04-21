import 'dart:convert';

import 'package:final_project/provider/auth_provider.dart';
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
  void initState() {
    super.initState();
  }

  late Future<List<CartModel>>? _cartsFuture;
  Future<List<CartModel>> fetchCarts(String _token) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/cart'), headers: {
      'Authorization': 'Bearer $_token',
    });
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)['cartItems'] as List;
      return jsonList.map((json) => CartModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? _token =
        Provider.of<AuthProvider>(context, listen: true).getAccount()?.token;
    print(_token);
    _cartsFuture = fetchCarts(_token!);
    return FutureBuilder<List<CartModel>>(
        future: _cartsFuture,
        builder:
            (BuildContext context, AsyncSnapshot<List<CartModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<CartModel> data = snapshot.data!
                  .where((element) => (element.product != null))
                  .toList();
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key("1"),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          data!.removeAt(index);
                        });
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

/**
 *
 *  Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: _carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key("1"),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
              });
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
            child: CartCard(cart: demoCarts[index]),
          ),
        ),
      ),
    );
 */
