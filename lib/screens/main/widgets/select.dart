import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shutter_count/state.dart';

class MSelect extends StatelessWidget {
  const MSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MState>(context);

    return Column(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: Center(
                child: Text(
                  'Take a picture with your camera and open the RAW file with this button',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'TT Firs Neue',
                      color: Color(0xfff4f4f4),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => state.pick(),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(top: 25, bottom: 25),
                width: 200,
                height: 70,
                child: Center(
                  child: Text(
                    'Select',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'TT Firs Neue',
                        color: Color(0xff1f1f1f),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
