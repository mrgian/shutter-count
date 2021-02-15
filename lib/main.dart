import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:shutter_count/screens/main/main_screen.dart';
import 'package:shutter_count/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setStatusBarColor(MColors.white, animate: true);
    return MaterialApp(
      title: 'Shutter Count',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
