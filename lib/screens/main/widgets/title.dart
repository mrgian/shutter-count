import 'package:flutter/material.dart';

class MTitle extends StatelessWidget {
  const MTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              'Shutter Count',
              style: TextStyle(
                  fontFamily: 'TT Firs Neue',
                  color: Color(0xfff4f4f4),
                  fontSize: 40,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 70, right: 70),
          child: Center(
            child: Text(
              'Find out how many pictures your camera has taken',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'TT Firs Neue',
                  color: Color(0xffb7b7b7),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
