// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      isAdmin: json['is_admin'] as bool?,
      isSeller: json['is_seller'] as bool?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'is_admin': instance.isAdmin,
      'is_seller': instance.isSeller,
    };
