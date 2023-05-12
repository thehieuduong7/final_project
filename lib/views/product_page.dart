import 'package:final_project/components/layouts/app_theme.dart';
import 'package:final_project/components/products/nav_product_list.dart';
import 'package:final_project/components/products/product_card.dart';
import 'package:final_project/components/products/product_list.dart';
import 'package:final_project/models/product_model.dart';
import 'package:final_project/provider/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSearchStarted = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  List<ProductModel> searchedProducts = [];
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();

    return Consumer<ProductProvider>(builder: (context, productData, _) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: const NavProductList(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Awesome Store',
            style: AppTheme.of(context).title1,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: TextButton.icon(
                    style: TextButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      //Navigator.pushNamed(context, CartPage.routeName);
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text(''),
                    key: Key('cart'),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppTheme.of(context).primaryBackground,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Color(0xFF95A1AC),
                          size: 24,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            onChanged: (_) => EasyDebounce.debounce(
                              'tFMemberController',
                              Duration(milliseconds: 0),
                              () {
                                isSearchStarted =
                                    textController!.text.isNotEmpty &&
                                        textController!.text.trim().length > 0;
                                print('isSearchStarted $isSearchStarted');
                                if (isSearchStarted) {
                                  print('${textController!.text.trim()}');
                                  searchedProducts = productData.products!
                                      .where((item) => item.name
                                          .toLowerCase()
                                          .contains(textController!.text
                                              .trim()
                                              .toLowerCase()))
                                      .toList();
                                }
                                setState(() {});
                              },
                            ),
                            decoration: InputDecoration(
                              labelText: 'Search product here...',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: AppTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF95A1AC),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isGridView = !isGridView;
                        });
                      },
                      icon:
                          !isGridView ? Icon(Icons.grid_on) : Icon(Icons.list))
                ],
              ),
            ),
            Expanded(
              child: ProductList(
                isGridView: isGridView,
                products:
                    isSearchStarted ? searchedProducts : productData.products,
              ),
            ),
          ],
        ),
      );
    });
  }
}
