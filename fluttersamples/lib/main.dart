/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:12 
 * @Last Modified by: Tan Dong
 * @Last Modified time: 2019-02-22 22:43:34
 */
// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersamples/ui/home.dart';
import 'package:fluttersamples/utils/GlobalPagesLocalizations.dart';
import 'package:fluttersamples/utils/PageLocalizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        primaryColor: Color(0xFF0175c2),
        backgroundColor: Colors.white
      ),
      home: WelcomePage(),
      routes: {
        '/home': (context) => new HomePage(),
      },
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalPagesLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
        // ... other locales the app supports
      ],
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

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f7f7),
        child: Stack(
          children: <Widget>[
            Image(
              image: new AssetImage('assets/flutter.png'),
              fit: BoxFit.none,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: Text(PageLocalizations.of(context).taskTitle,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 26,
                      decoration: TextDecoration.none)),
            ),
          ],
        ));
  }

  //FLUTTER_STORAGE_BASE_URL:https://storage.flutter-io.cn
  //PUB_HOSTED_URL:https://pub.flutter-io.cn

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
    timer=null;

  }
}
