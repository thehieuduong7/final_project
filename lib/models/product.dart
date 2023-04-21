class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  int quantity;
  // final int type;

  // String brand;
  // String description;
  // int gender;
  // String color;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 0,
    // required this.type,
    // this.brand = "",
    // this.description = "",
    // this.gender = 1,
    // this.color = ""});
  });
}

List<Product> demoProducts = [
  Product(
      id: 1,
      name: 'Champion',
      image:
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
      price: 55.5),
  Product(
      id: 2,
      name: 'Stark',
      image:
          'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1624&q=80',
      price: 65.5),
  Product(
      id: 3,
      name: 'Coloury',
      image:
          'https://images.unsplash.com/photo-1604671801908-6f0c6a092c05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 75.5),
  Product(
      id: 4,
      name: 'Pinky',
      image:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      price: 87.5),
  Product(
      id: 5,
      name: 'Power',
      image:
          'https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80',
      price: 67.5),
  Product(
      id: 6,
      name: 'Classic',
      image:
          'https://images.unsplash.com/photo-1575537302964-96cd47c06b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 87.5),
  Product(
      id: 7,
      name: 'Monk',
      image:
          'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80',
      price: 50.5),
  Product(
      id: 8,
      name: 'Piece',
      image:
          'https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 99.5),
  Product(
      id: 9,
      name: 'Baby',
      image:
          'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80',
      price: 87.5),
  Product(
      id: 10,
      name: 'Grown',
      image:
          'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: 144.5),
];
