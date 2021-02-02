import 'dart:io';

import 'package:exif/exif.dart';
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

      readExif(file);
    }
  }

  Future readExif(File file) async {
    Map<String, IfdTag> data =
        await readExifFromBytes(await file.readAsBytes());

    for (var key in data.keys) {
      print(key);
      print(data[key]);
    }
  }
}
