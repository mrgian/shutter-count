import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shutter_count/state.dart';
import 'package:shutter_count/utils/status.dart';

class MBody extends StatelessWidget {
  const MBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MState>(context);

    switch (state.status) {
      case Status.notSelected:
        return Container();
        break;
      case Status.loading:
        return Center(child: CircularProgressIndicator());
        break;
      case Status.error:
        return Text('Error');
        break;
      case Status.done:
        return Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xfff4f4f4),
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  state.model,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xfff4f4f4),
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'has taken',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xfff4f4f4),
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  state.count,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xfff4f4f4),
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'pictures',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xfff4f4f4),
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
        );
        break;
    }

    return Container();
  }
}
