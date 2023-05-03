import 'package:json_annotation/json_annotation.dart';
import 'package:final_project/models/product_model.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  int? quantity;
  String? id;
  int? size;
  ProductModel? product;

  OrderDetail({
    this.quantity,
    this.id,
    this.size,
    this.product,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}