import 'package:flutter/material.dart';

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
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          // Expanded(
          //     child: ListView.builder(
          //         scrollDirection: Axis.vertical,
          //         shrinkWrap: true,
          //         itemCount: 20,
          //         itemBuilder: (BuildContext context, int index) {
          //           return CheckboxListTile(
          //               value: true,
          //               title: Text(index.toString()),
          //               onChanged: (onChanged) {});
          //         }))
        ],
      ),
    );
  }
}
