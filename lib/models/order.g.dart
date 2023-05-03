// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: json['orderId'] as String?,
      orderStatus: json['orderStatus'] as int?,
      orderCreateDay: json['orderCreateDay'] as String?,
      orderTotal: json['orderTotal'] as int?,
      orderDetail: (json['orderDetail'] as List<dynamic>?)
          ?.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'orderStatus': instance.orderStatus,
      'orderCreateDay': instance.orderCreateDay,
      'orderTotal': instance.orderTotal,
      'orderDetail': instance.orderDetail,
    };
