import 'package:final_project/components/layouts/app_theme.dart';
import 'package:final_project/components/products/count_controller.dart';
import 'package:final_project/models/account_model.dart';
import 'package:final_project/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int? countControllerValue;
  String? selectedValue = '36';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.of(context).secondaryText,
            size: 24,
          ),
        ),
        title: Text(
          ' ${widget.product.name}',
          style: AppTheme.of(context).subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF151B1E),
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
            // ignore: prefer_const_constructors
            child: Badge(
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: Colors.green,
              ),
              //icon style
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Hero(
                      tag: 'mainImage',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.product.product_image![0],
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Text(
                      '${widget.product.name}',
                      style: AppTheme.of(context).title1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: Text(
                      'Giá: ${widget.product.price}đ',
                      textAlign: TextAlign.start,
                      style: AppTheme.of(context).subtitle1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Text(
                      'Mô tả: ${widget.product.description}',
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Text(
                      'Hãng: ${widget.product.brand}',
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Text(
                      'Màu sắc: ${widget.product.color}',
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Text(
                      'Kích thước:',
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            RadioListTile<String>(
                              title: Text('36'),
                              value: '36',
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text('37'),
                              value: '37',
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text('38'),
                              value: '38',
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                      // child: Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: ["36", "37", "38", "40"]
                      //       .map((e) => SizedBox(
                      //             width: 50,
                      //             child: ListTile(
                      //               title: Text(e),
                      //               leading: Radio(
                      //                 value: e,
                      //                 groupValue: selectedValue,
                      //                 onChanged: (value) {
                      //                   setState(() {
                      //                     selectedValue = value.toString();
                      //                   });
                      //                 },
                      //               ),
                      //             ),
                      //           ))
                      //       .toList(),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Text(
                      widget.product.gender == 1
                          ? "Giới tính: Nam"
                          : "Giới tính: Nữ",
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x320F1113),
                    offset: Offset(0, -2),
                  )
                ],
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 34),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: AppTheme.of(context).primaryBackground,
                          width: 2,
                        ),
                      ),
                      child: CountController(
                        decrementIconBuilder: (enabled) => Icon(
                          Icons.remove_rounded,
                          color: enabled
                              ? AppTheme.of(context).secondaryText
                              : AppTheme.of(context).secondaryText,
                          size: 16,
                        ),
                        incrementIconBuilder: (enabled) => Icon(
                          Icons.add_rounded,
                          color: enabled
                              ? AppTheme.of(context).primaryColor
                              : AppTheme.of(context).secondaryText,
                          size: 16,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: AppTheme.of(context).subtitle1,
                        ),
                        count: countControllerValue ??= 1,
                        updateCount: (count) =>
                            setState(() => countControllerValue = count),
                        stepSize: 1,
                        minimum: 1,
                      ),
                    ),
                    //   MyButtonWidget(
                    //     onPressed: () {
                    //       Product p = widget.product;
                    //       p.quantity = countControllerValue!.toInt();
                    //       BlocProvider.of<CartBloc>(context).add(AddProduct(p));
                    //     },
                    //     text: 'Add to Cart',
                    //     options: ButtonOptions(
                    //         width: 160,
                    //         height: 50,
                    //         color: AppTheme.of(context).primaryColor,
                    //         textStyle: AppTheme.of(context).subtitle2.override(
                    //               fontFamily: 'Poppins',
                    //               color: Colors.white,
                    //             ),
                    //         elevation: 5,
                    //         borderSide: BorderSide(
                    //           color: Colors.black,
                    //           width: 2,
                    //         ),
                    //         borderRadius: BorderRadius.all(Radius.circular(36))),
                    // ),
                    ElevatedButton.icon(
                        onPressed: () {
                          addToCart(
                              widget.product.id,
                              int.tryParse(selectedValue ?? ''),
                              countControllerValue);
                        },
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                        ),
                        label: Text("Add to cart"),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addToCart(String? product_id, int? size, int? quantity) async {
    final url = Uri.parse('http://10.0.2.2:8080/cart');
    final body = jsonEncode({
      'product_id': product_id,
      'size': size,
      'quantity': quantity,
    });
    String? _token =
        Provider.of<AuthProvider>(context, listen: false).getAccount()?.token;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_token'
    };

    final response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success!'),
            content: Text('Your operation was successful.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print('fail');
    }
  }
}
