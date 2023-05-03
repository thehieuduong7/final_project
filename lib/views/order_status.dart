import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/models/order.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class OrderStatusListPage extends StatefulWidget {
  @override
  _OrderStatusListPageState createState() => _OrderStatusListPageState();
}

class _OrderStatusListPageState extends State<OrderStatusListPage> {
  late Future<List<Order>> _futureOrderResponse;

  @override
  void initState() {
    super.initState();
    _futureOrderResponse = _fetchOrders();
  }

  Future<List<Order>> _fetchOrders() async {
    String? _token = Provider
        .of<AuthProvider>(context, listen: false)
        .getAccount()
        ?.token;
    final headers = {'Authorization': 'Bearer $_token'};
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/order/user'), headers: headers);
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)['orders'] as List;
      return jsonList.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: FutureBuilder<List<Order>>(
        future: _futureOrderResponse,
        builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching orders.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final order = snapshot.data![index];
                return ListTile(
                  title: Text('Order ID: ${snapshot.data![index].orderId}'),
                  // subtitle: Text('Total: ${order['orderTotal']}'),
                  // trailing: Text('Status: ${order['orderStatus']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
