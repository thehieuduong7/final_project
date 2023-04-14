import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'account_model.g.dart';

@JsonSerializable()
class Account {
  String? token;

  User? user;

  @JsonKey(name: 'is_admin')
  bool? isAdmin;

  @JsonKey(name: 'is_seller')
  bool? isSeller;

  Account({
    this.token,
    this.user,
    this.isAdmin,
    this.isSeller,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}