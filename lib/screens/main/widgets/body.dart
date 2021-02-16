import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shutter_count/state.dart';
import 'package:shutter_count/utils/colors.dart';
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
        return MBox(text: 'Error processing file :(');
        break;
      case Status.notSupported:
        return MBox(text: 'Sorry your camera is not supported :(');
        break;
      case Status.badFormat:
        return MBox(text: 'Make sure you select a RAW image');
        break;
      case Status.done:
        return Center(
          child: Container(
            height: 330,
            width: 330,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: MColors.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  state.model,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'has taken',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  state.count,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'pictures',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
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

class MBox extends StatelessWidget {
  const MBox({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 330,
        width: 330,
        decoration: BoxDecoration(
            color: MColors.black, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'TT Firs Neue',
                  color: MColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
