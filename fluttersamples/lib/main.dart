import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersamples/ui/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
  runApp(WelcomeView());
}

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      routes: {
        '/home': (context) => new HomePage(),
      },
      // debugShowMaterialGrid: false,
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeState();
  }
}

class WelcomeState extends State<WelcomePage> {
  Timer timer;
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white70,
        // child:new Image.asset("assets/flutter-mark-square-64.png")
        child: Stack(
          children: <Widget>[
            Image(
              image: new AssetImage('assets/flutter-mark-square-64.png'),
              fit: BoxFit.none,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              child: Text('欢迎Flutter',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.orange,
                      decoration: TextDecoration.none)),
            ),
            
          ],
        )
        // Column(
        //   children: <Widget>[
        //     Text('欢迎Flutter',
        //         textAlign: TextAlign.center,
        //         softWrap: true,
        //         style: TextStyle(
        //             fontWeight: FontWeight.normal,
        //             color: Colors.orange,
        //             decoration: TextDecoration.none)),
        //     Image(
        //       image: new AssetImage('assets/flutter-mark-square-64.png'),
        //       fit: BoxFit.none,
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height,
        //     ),
        //   ],
        // )
        );
  }

  @override
  void initState() {
    super.initState();
    countDown();
    timer = new Timer(Duration(milliseconds: 3 * 1000), () {});
  }

  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, gotoPage);
  }

  void gotoPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void dispose() {
    super.dispose();
  }
}
