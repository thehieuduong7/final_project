import 'package:final_project/models/user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  String errorMessage = "";
  bool isAuthenticated() => _user != null;
  // Add authentication functions here

  Future<void> signIn(String email, String password) async {
    try {
      if (email == 'admin') {
        _user = User("admin", "123");
      } else {
        _user = null;
        errorMessage = "login fail";
      }
    } on Exception catch (_) {
      _user = null;
      errorMessage = "login fail";
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    _user = null;
    errorMessage = "";
    notifyListeners();
  }
}
