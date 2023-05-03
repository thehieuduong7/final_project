// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'size': instance.size,
    };
