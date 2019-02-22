/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:30:05 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:30:05 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VisibleSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VisibleSamplesState();
  }
}

class VisibleSamplesState extends State<VisibleSamples> {
  bool visible = true;
  bool offstage = true;
  bool ignorePointer = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visible'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //invisible
            RaisedButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: Text('RaisedButton'),
            ),
            IgnorePointer(
                ignoring: true,
                child:
                    Opacity(opacity: visible ? 1.0 : 0.0, child: Text('data'))),
            //gone
            RaisedButton(
              onPressed: () {
                setState(() {
                  offstage = !offstage;
                });
              },
              child: Text('RaisedButton'),
            ),
            Offstage(
              offstage: offstage,
              child: Text('Offstage'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  ignorePointer = !ignorePointer;
                });
              },
              child: Text('RaisedButton'),
            ),
            IgnorePointer(
                ignoring: ignorePointer, child: Text('IgnorePointer')),
            RaisedButton(
              onPressed: () {},
              child: Text('RaisedButton'),
            ),
          ],
        ),
      ),
    );
  }
}
