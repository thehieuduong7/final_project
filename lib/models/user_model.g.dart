// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as int?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'phone': instance.phone,
      'avatar': instance.avatar,
    };
