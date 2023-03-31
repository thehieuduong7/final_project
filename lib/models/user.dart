import 'package:flutter/material.dart';

class User {
  String? name;
  int? age;
  int? gender;
  String? address;
  String? phone;
  String? avatar;

  User(
      {this.name,
      this.age,
      this.gender,
      this.address,
      this.phone,
      this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], age: json['age'], gender: json['gender']);
  }
}
