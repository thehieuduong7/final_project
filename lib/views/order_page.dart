import 'package:final_project/models/cart_model.dart';
import 'dart:convert';
import 'package:final_project/provider/cart_provider.dart';
import 'package:final_project/views/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../components/products/product_list.dart';
import '../provider/auth_provider.dart';
import 'home/home_screen.dart';

class MyView extends StatefulWidget {
  @override
  _MyViewState createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  String? _selectedShipId;
  String? _location;
  String? _receiverName;
  String? _receiverPhone;
  int? _total;
  List<CartModel>? cartList;

  @override
  Widget build(BuildContext context) {
    _total = Provider.of<CartProvider>(context, listen: false).getTotal();
    cartList = Provider.of<CartProvider>(context, listen: false).getCarts();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Chọn loại vận chuyển'),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: _selectedShipId,
              items: [
                DropdownMenuItem(
                  value: '6425842eddeca96417cd14cb',
                  child: Text('Nhanh'),
                ),
                DropdownMenuItem(
                  value: '64258441ddeca96417cd14cf',
                  child: Text('Hỏa tốc'),
                ),
              ],
              onChanged: _handleShipIdChange,
            ),
            SizedBox(height: 16.0),
            Text('Địa chỉ'),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: _handleLocationChange,
            ),
            SizedBox(height: 16.0),
            Text('Tên người nhận'),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: _handleReceiverNameChange,
            ),
            SizedBox(height: 16.0),
            Text('Số điện thoại người nhận'),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              onChanged: _handleReceiverPhoneChange,
            ),
            SizedBox(height: 16.0),
            Text('Số sản phẩm đặt hàng: ${cartList!.length}'),
            SizedBox(height: 16.0),
            Text('Total: ${_total}VND'), // Replace 0 with the actual total
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleOrderButtonPressed,
              child: Text('Order'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleShipIdChange(String? value) {
    setState(() {
      _selectedShipId = value;
    });
    if (_selectedShipId == '6425842eddeca96417cd14cb') {
      _total = (_total ?? 0) + 15000;
    } else {
      _total = (_total ?? 0) + 30000;
    }
  }

  void _handleLocationChange(String value) {
    setState(() {
      _location = value;
    });
  }

  void _handleReceiverNameChange(String value) {
    setState(() {
      _receiverName = value;
    });
  }

  void _handleReceiverPhoneChange(String value) {
    setState(() {
      _receiverPhone = value;
    });
  }

  void _handleOrderButtonPressed() {
    String? _token =
        Provider.of<AuthProvider>(context, listen: false).getAccount()?.token;
    postOrder(_token);
  }

  Future<void> postOrder(String? _token) async {
    var url =
        'http://10.0.2.2:8080/order'; // Replace with your actual API endpoint URL

    List<Map<String, dynamic>> items = [];
    for (var item in cartList ?? []) {
      items.add({
        "product_id": item.product?.id,
        "size": item.size.toString(),
        "quantity": item.quantity.toString()
      });
    }

    var body = json.encode({
      "items": items,
      "total": _total,
      "ship_id": _selectedShipId,
      "payment_method": 1,
      "location": _location,
      "receiver_name": _receiverName,
      "receiver_phone": _receiverPhone,
      "is_fast_buy": false
    });


    print(body);
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $_token'
        },
        body: body);

    if (response.statusCode == 200) {
      // Handle successful response
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success!'),
            content: Text('Order successfully!!!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle unsuccessful response
      print('Failed to place order. Error code: ${response.statusCode}');
    }
  }
}
