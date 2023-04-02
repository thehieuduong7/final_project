import 'package:final_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  User? _user;
  String errorMessage = "";
  bool isAuthenticated() => _user != null;
  // Add authentication functions here

  Future<void> signIn(String email, String password) async {
    try {
      if (email == 'admin') {
        _user = User(
            name: "admin",
            age: 12,
            gender: 1,
            address: "sai gon",
            phone: "102030",
            avatar: null);
      } else {
        _user = null;
        errorMessage = "login fail";
      }
    } on Exception catch (_) {
      _user = null;
      errorMessage = "login fail";
    }
    try {
      // var response = http.post()
    } catch (e) {}
    notifyListeners();
  }

  Future<void> signOut() async {
    _user = null;
    errorMessage = "";
    notifyListeners();
  }
}
