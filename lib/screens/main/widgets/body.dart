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
        return Center(
          child: Container(
            height: 330,
            width: 330,
            //padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: MColors.black, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Sorry your camera is not supported :(',
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
        break;
      case Status.done:
        return Center(
          child: Container(
            height: 330,
            width: 330,
            //padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: MColors.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your',
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  state.model,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'has taken',
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  state.count,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: MColors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'pictures',
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
