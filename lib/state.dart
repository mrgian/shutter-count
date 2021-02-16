import 'dart:io';

import 'package:exif/exif.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:shutter_count/utils/status.dart';

class MState with ChangeNotifier {
  Status _status = Status.notSelected;
  Status get status => _status;

  String _model = "";
  String get model => _model;

  String _count = "";
  String get count => _count;

  Future pick() async {
    _status = Status.loading;
    notifyListeners();

    try {
      File file = await FilePicker.getFile();

      if (file != null) {
        if (file.path.endsWith('jpg') || file.path.endsWith('png'))
          _status = Status.badFormat;
        else
          await _readExif(file);
      } else
        _status = Status.error;
    } on Exception catch (e) {
      _status = Status.error;
    }

    notifyListeners();
  }

  Future _readExif(File file) async {
    Map<String, IfdTag> data =
        await readExifFromBytes(await file.readAsBytes());

    _model = data["Image Model"].toString();
    _count = data["MakerNote TotalShutterReleases"].toString();

    if (_model == "null" || _count == "null")
      _status = Status.notSupported;
    else
      _status = Status.done;

    notifyListeners();
  }
}
