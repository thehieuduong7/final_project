import 'package:final_project/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
import './product_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  ProductModel? product;
  int? quantity;
  int? size;

  CartModel({this.product, this.quantity, this.size});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  CartModel toJson() => _$CartModelFromJson(this as Map<String, dynamic>);
}

// Demo data for our cart

List<CartModel> demoCarts = [
  CartModel(product: demoProducts[0], quantity: 2, size: 40),
  CartModel(product: demoProducts[1], quantity: 1, size: 40),
  CartModel(product: demoProducts[2], quantity: 1, size: 40),
];
