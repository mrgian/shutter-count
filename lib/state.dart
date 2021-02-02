import 'dart:io';

import 'package:exif/exif.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MyState with ChangeNotifier {
  String _filePath = "";
  String get filePath => _filePath;

  String _model = "";
  String get model => _model;

  String _count = "";
  String get count => _count;

  Future pick() async {
    File file = await FilePicker.getFile();

    if (file != null) {
      _filePath = file.path;

      await readExif(file);
    }
  }

  Future readExif(File file) async {
    Map<String, IfdTag> data =
        await readExifFromBytes(await file.readAsBytes());

    _model = data["Image Model"].toString();
    _count = data["MakerNote TotalShutterReleases"].toString();

    notifyListeners();
  }
}
