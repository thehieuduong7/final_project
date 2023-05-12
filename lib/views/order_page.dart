import 'package:final_project/models/cart_model.dart';
import 'dart:convert';
import 'package:final_project/provider/cart_provider.dart';
import 'package:final_project/views/customer_page.dart';
import 'package:final_project/views/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../components/products/product_list.dart';
import '../provider/auth_provider.dart';
import 'home/home_screen.dart';

class OrderPage extends StatefulWidget {
  List<CartModel>? carts;
  OrderPage({Key? key, required this.carts}) : super(key: key);
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _controllerLocation =
      TextEditingController(text: '');
  final TextEditingController _controllerName = TextEditingController(text: '');
  final TextEditingController _controllerPhone =
      TextEditingController(text: '');

  String? _selectedShipId;
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).loadUser();
    _total = getTotal();
    return Consumer<AuthProvider>(builder: (context, authData, _) {
      _controllerLocation.text = authData.user?.address ?? "";
      _controllerName.text = authData.user?.name ?? "";
      _controllerPhone.text = authData.user?.phone ?? "";

      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Create Order'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
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
                    controller: _controllerLocation,
                  ),
                  SizedBox(height: 16.0),
                  Text('Tên người nhận'),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: _controllerName,
                  ),
                  SizedBox(height: 16.0),
                  Text('Số điện thoại người nhận'),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: _controllerPhone,
                  ),
                  SizedBox(height: 16.0),
                  // Text('Số sản phẩm đặt hàng: ${cartList?.length}'),
                  SizedBox(height: 16.0),
                  Text(
                      'Total: ${_total}VND'), // Replace 0 with the actual total
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _handleOrderButtonPressed,
                    child: Text('Order'),
                  ),
                ],
              ),
            )),
      );
    });
  }

  void _handleShipIdChange(String? value) {
    setState(() {
      _selectedShipId = value;
    });
    print("total ${_total}");
  }

  int getTotal() {
    if (widget.carts == null) {
      return 0;
    }
    int sum = 0;
    widget.carts?.forEach((element) {
      sum += (element.product?.price ?? 0) * (element.quantity ?? 0);
    });
    switch (_selectedShipId) {
      case '6425842eddeca96417cd14cb':
        sum = (sum ?? 0) + 15000;
        break;
      case null:
        break;
      default:
        sum = (sum ?? 0) + 30000;
    }

    return sum;
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
    for (var item in widget.carts ?? []) {
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
      "location": _controllerLocation.text,
      "receiver_name": _controllerName.text,
      "receiver_phone": _controllerPhone.text,
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
                    MaterialPageRoute(builder: (context) => CustomerPage()),
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
