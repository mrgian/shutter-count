import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shutter_count/screens/main/body.dart';
import 'package:shutter_count/screens/main/select.dart';
import 'package:shutter_count/state.dart';
import 'package:shutter_count/screens/main/title.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MState(),
      child: Scaffold(
        backgroundColor: Color(0xff1f1f1f),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [MTitle(), Expanded(child: MBody()), MSelect()],
          ),
        ),
      ),
    );
  }
}
