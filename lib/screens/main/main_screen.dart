import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shutter_count/state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyState(),
      child: Scaffold(
        backgroundColor: Color(0xff1f1f1f),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Title(), Expanded(child: Body()), BottomButton()],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MyState>(context);

    if (state.model != "")
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
                'till this picture',
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
    else
      return Container();
  }
}

class Title extends StatelessWidget {
  const Title({Key key}) : super(key: key);

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
                  fontFamily: 'Inter',
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
                  fontFamily: 'Inter',
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

class BottomButton extends StatelessWidget {
  const BottomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MyState>(context);

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
                      fontFamily: 'Inter',
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
                        fontFamily: 'Inter',
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
