import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String? name;
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
    this.name,
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
