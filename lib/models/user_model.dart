import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;

  String? name;

  int? age;

  int? gender;

  String? address;

  String? phone;

  String? avatar;

  User({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.address,
    this.phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
