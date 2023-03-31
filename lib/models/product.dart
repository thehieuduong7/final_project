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
