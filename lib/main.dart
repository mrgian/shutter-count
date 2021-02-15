import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

import 'package:shutter_count/screens/main/main_screen.dart';
import 'package:shutter_count/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);
    FlutterStatusbarManager.setColor(MColors.white, animated: true);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shutter Count',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);
    FlutterStatusbarManager.setColor(MColors.white, animated: true);
  }
}
