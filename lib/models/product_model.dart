import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String name;
  List<String>? product_image;
  int? price;
  int? type;
  String? brand;
  String? description;
  int? gender;
  String? color;
  Map<String, dynamic>? size;
  bool? is_active;
  int? discount;
  String? created_at;

  ProductModel({
    this.id,
    required this.name,
    this.product_image,
    this.price,
    this.type,
    this.brand,
    this.description,
    this.gender,
    this.color,
    this.size,
    this.is_active,
    this.discount,
    this.created_at,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

List<ProductModel> demoProducts = [
  ProductModel(
      id: "10",
      name: 'Grown',
      product_image: [
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
      ],
      price: 144),
  ProductModel(
      id: "11",
      name: 'Grown1',
      product_image: [
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
      ],
      price: 144),
  ProductModel(
      id: "12",
      name: 'Grown2',
      product_image: [
        'https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
      ],
      price: 144),
];
