import 'package:final_project/components/products/expansionpanel_filter.dart';
import 'package:flutter/material.dart';

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
  const NavProductList({Key? key}) : super(key: key);

  @override
  _NavProductListState createState() => _NavProductListState();
}

class _NavProductListState extends State<NavProductList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ExpansionpanelFilter(
            steps: convertToStep(optionFilter),
          )
        ],
      ),
    );
  }
}
