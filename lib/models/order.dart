import 'package:json_annotation/json_annotation.dart';
import 'order_detail.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? orderId;
  int? orderStatus;
  String? orderCreateDay;
  int? orderTotal;
  List<OrderDetail>? orderDetail;

  Order({
    this.orderId,
    this.orderStatus,
    this.orderCreateDay,
    this.orderTotal,
    this.orderDetail,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}