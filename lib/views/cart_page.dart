import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of items in the cart
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.network(
                    'https://via.placeholder.com/150x150.png'), // Replace with the actual image URL
                title: Text('Product ${index + 1}'),
                subtitle: Text('Price: \$${(index + 1) * 10}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implement the logic to remove the item from the cart
                  },
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child:
                    Text('Total: \$50'), // Replace with the actual total price
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: FloatingActionButton(
                  child: Text('Checkout'),
                  onPressed: () {
                    // Implement the logic to proceed to the checkout
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
