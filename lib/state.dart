import 'package:flutter/material.dart';

class MyState with ChangeNotifier {
  String _text = "hello";

  String get text => _text;

  set text(String newValue) {
    _text = newValue;
    notifyListeners();
  }
}
