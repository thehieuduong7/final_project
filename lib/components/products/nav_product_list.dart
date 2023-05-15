import 'package:final_project/components/products/expansionpanel_filter.dart';
import 'package:final_project/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var optionFilter = [
  {
    "tilte": "Gender",
    "body": Expanded(
        child: ListView(
            shrinkWrap: true,
            children: ["Male", "Female"]
                .map((e) => ListTile(
                      title: Text(e),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ))
                .toList())),
  },
  {
    "tilte": "Category",
    "body": Expanded(
        child: ListView(
            shrinkWrap: true,
            children: ["Snaker", "Sandal"]
                .map((e) => ListTile(
                      title: Text(e),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ))
                .toList())),
  },
  {
    "tilte": "Brand",
    "body": Expanded(
        child: ListView(
            shrinkWrap: true,
            children: ["Nike", "Adidas", "Reebook"]
                .map((e) => ListTile(
                      title: Text(e),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ))
                .toList())),
  },
  {
    "tilte": "Color",
    "body": Expanded(
        child: ListView(
            shrinkWrap: true,
            children: ["Red", "Blue", "Black", "White", "Yellow", "Gray"]
                .map((e) => ListTile(
                      title: Text(e),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ))
                .toList())),
  },
  {
    "tilte": "Size",
    "body": Expanded(
        child: ListView(
            shrinkWrap: true,
            children: ["38", "39", "40", "41", "42", "43"]
                .map((e) => ListTile(
                      title: Text(e),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ))
                .toList())),
  }
];

class NavProductList extends StatefulWidget {
  List<CategoryFilter> filters;
  NavProductList({Key? key, required this.filters}) : super(key: key);

  @override
  _NavProductListState createState() => _NavProductListState();
}

class _NavProductListState extends State<NavProductList> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<ProductProvider>(context, listen: false).loadFilter();
    return Drawer(
      child: ListView(
        children: <Widget>[
          ExpansionpanelFilter(
            filters: widget.filters,
          )
        ],
      ),
    );
  }
}
