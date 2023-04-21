// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      product_image: (json['product_image'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price: json['price'] as int?,
      type: json['type'] as int?,
      brand: json['brand'] as String?,
      description: json['description'] as String?,
      gender: json['gender'] as int?,
      color: json['color'] as String?,
      size: json['size'] as Map<String, dynamic>?,
      is_active: json['is_active'] as bool?,
      discount: json['discount'] as int?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_image': instance.product_image,
      'price': instance.price,
      'type': instance.type,
      'brand': instance.brand,
      'description': instance.description,
      'gender': instance.gender,
      'color': instance.color,
      'size': instance.size,
      'is_active': instance.is_active,
      'discount': instance.discount,
      'created_at': instance.created_at,
    };
