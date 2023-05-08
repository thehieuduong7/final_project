import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/models/order.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
    String? _token =
        Provider.of<AuthProvider>(context, listen: false).getAccount()?.token;
    final headers = {'Authorization': 'Bearer $_token'};
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/order/user'), headers: headers);
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
      body: FutureBuilder<List<dynamic>>(
        future: _futureOrderResponse,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: Colors.lightBlueAccent,
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Order date: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(snapshot.data![index].orderCreateDay))}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Order total: ${snapshot.data![index].orderTotal}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Order status: ${(snapshot.data![index].orderStatus == 1) ? 'Đã đặt hàng' : (snapshot.data![index].orderStatus == 2) ? 'Đang giao hàng' : 'Đơn hàng hoàn tất'}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data![index].orderDetail.length,
                        itemBuilder: (BuildContext context, int i) {
                          return Card(
                              color: Colors.blueGrey,
                              margin: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '${i+1}. ${snapshot.data![index].orderDetail[i].product.name}',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.network(
                                      '${snapshot.data![index].orderDetail[i].product.product_image[0]}',
                                      width: 100.0,
                                      height: 100.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Size: ${snapshot.data![index].orderDetail[i].size}',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Quantity: ${snapshot.data![index].orderDetail[i].quantity}',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ));
                        },
                      ),
                    ],
                  ));
            },
          );
        },
      ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Orders'),
//     ),
//     body: FutureBuilder<List<Order>>(
//       future: _futureOrderResponse,
//       builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('Error fetching orders.'),
//           );
//         } else {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (BuildContext context, int index) {
//               final order = snapshot.data![index];
//               return ListTile(
//                 title: Text('Order ID: ${snapshot.data![index].orderId}'),
//                 // subtitle: Text('Total: ${order['orderTotal']}'),
//                 // trailing: Text('Status: ${order['orderStatus']}'),
//               );
//             },
//           );
//         }
//       },
//     ),
//   );
// }
}
