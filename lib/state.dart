import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MyState with ChangeNotifier {
  bool _picked = false;
  bool get picked => _picked;

  String _filePath = "";
  String get filePath => _filePath;

  Future pick() async {
    _picked = false;
    notifyListeners();

    File file = await FilePicker.getFile();

    if (file != null) {
      _filePath = file.path;
      _picked = true;
      notifyListeners();
    }
  }
}
