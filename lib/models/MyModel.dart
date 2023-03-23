import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  String text = "Hello";
  static int id = 1;
  void doSomething() {
    id++;
    text = "World$id";
    notifyListeners();
  }
}
