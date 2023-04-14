import 'dart:convert';
import 'package:final_project/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/models/account_model.dart';

class AuthProvider extends ChangeNotifier {
  Account? _account;
  String errorMessage = "";

  bool isAuthenticated() => _account != null;

  // Add authentication functions here

  Future<void> signIn(String email, String password) async {
    try {
      Account resAccount = await loginUser(email, password);
      if (resAccount.token != null) {
        _account = resAccount;
      } else {
        _account = null;
        errorMessage = "login fail";
      }
    } on Exception catch (_) {
      _account = null;
      errorMessage = "login fail";
    }
    notifyListeners();
  }

  Future<Account> loginUser(String email, String password) async {
    final url = Uri.parse('http://192.168.1.13:8080/login/');
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Account.fromJson(responseData);
    } else {
      throw Exception('Failed to load response');
    }
  }

  // Future<void> signIn(String email, String password) async {
  //   try {
  //     if (email == 'admin') {
  //       _user = User(
  //           name: "admin",
  //           age: 12,
  //           gender: 1,
  //           address: "sai gon",
  //           phone: "102030",
  //           avatar: null);
  //     } else {
  //       _user = null;
  //       errorMessage = "login fail";
  //     }
  //   } on Exception catch (_) {
  //     _user = null;
  //     errorMessage = "login fail";
  //   }
  //   try {
  //     // var response = http.post()
  //   } catch (e) {}
  //   notifyListeners();
  // }

  Future<void> signOut() async {
    _account = null;
    errorMessage = "";
    notifyListeners();
  }
}
