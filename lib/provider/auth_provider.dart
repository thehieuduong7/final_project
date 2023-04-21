import 'dart:convert';
import 'package:final_project/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/models/account_model.dart';

class AuthProvider extends ChangeNotifier {
  Account? _account;
  String errorMessage = "";

  bool isAuthenticated() => _account != null;

  Account? getAccount() {
    return _account;
  }

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
    final url = Uri.parse('http://10.0.2.2:8080/login/');
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
      _account = Account.fromJson(responseData);
      return Account.fromJson(responseData);
    } else {
      throw Exception('Failed to load response');
    }
  }

  Future<void> signOut() async {
    _account = null;
    errorMessage = "";
    notifyListeners();
  }
}
