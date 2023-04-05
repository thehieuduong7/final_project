import 'package:final_project/views/home/home_screen.dart';

import 'cart_page.dart';
import 'profile_page.dart';
import 'product_page.dart';

import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: mapToPage[_navBarItems[_selectedIndex].label],
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _navBarItems,
      ),
    );
  }
}

const _navBarItems = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.bookmark_border_outlined),
    selectedIcon: Icon(Icons.bookmark_rounded),
    label: 'Product',
  ),
  NavigationDestination(
    icon: Icon(Icons.shopping_bag_outlined),
    selectedIcon: Icon(Icons.shopping_bag),
    label: 'Cart',
  ),
  NavigationDestination(
    icon: Icon(Icons.person_outline_rounded),
    selectedIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];

const mapToPage = {
  'Profile': ProfilePage(),
  'Cart': CartPage(),
  'Product': ProductPage(),
  'Home': HomePage()
};
