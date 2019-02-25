/*
 * @Author: Tan Dong 
 * @Date: 2019-02-25 20:34:29 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-25 20:34:29 
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
  bool opacityVisible = true;
  bool renderTree = true;
  bool visibility = true;

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
            ///Invisible
            ///通过IgnorePointer和Opacity透明度控制显示隐藏
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
                child: Opacity(
                    opacity: visible ? 1.0 : 0.0,
                    child: Text('IgnorePointer Opacity'))),

            ///Gone
            ///通过Offstage控制显示隐藏
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

            ///Invisible
            ///直接通过Opacity透明度控制显示隐藏
            RaisedButton(
              onPressed: () {
                setState(() {
                  opacityVisible = !opacityVisible;
                });
              },
              child: Text('RaisedButton'),
            ),
            Opacity(
              opacity: opacityVisible ? 1.0 : 0.0,
              child: Text('Opacity'),
            ),

            ///Gone
            ///通过移除Widget来控制显示隐藏
            RaisedButton(
              onPressed: () {
                setState(() {
                  renderTree = !renderTree;
                });
              },
              child: Text('RaisedButton'),
            ),
            renderTree ? Text('RenderTree') : Container(),
            RaisedButton(
              onPressed: () {
                setState(() {
                  visibility = !visibility;
                });
              },
              child: Text('RaisedButton'),
            ),

            ///Gone
            ///通过Visibility来控制显示隐藏
            Visibility(
              visible: visibility,
              child: Text('Visibility'),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('BottomRaisedButton'),
            ),
          ],
        ),
      ),
    );
  }
}
