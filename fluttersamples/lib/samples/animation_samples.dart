import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/samples/card_samples.dart';

class AnimationSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationSamplesState();
  }
}

class AnimationSamplesState extends State<AnimationSamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: animation1(context),
    );
  }
}

Widget animation1(BuildContext context) {
  return Column(
    children: <Widget>[
      AnimatedCrossFade(
        duration: const Duration(seconds: 3),
        firstChild:
            const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
        secondChild:
            const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
        crossFadeState: CrossFadeState.showSecond,
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
      ),
      AnimatedContainer(
        padding: EdgeInsets.all(100),
        curve: Curves.bounceOut,
        duration: const Duration(seconds: 3),
        child: const FlutterLogo(
          size: 30,
        ),
      ),
      GestureDetector(
        child: Hero(
          tag: 'hero',
          child: FlutterLogo(
            size: 30,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return CardSamples();
        }));
        },
      ),
    ],
  );
}

Widget listBody1() {
  return Flex(
    direction: Axis.horizontal,
    children: <Widget>[
      ListBody(
        mainAxis: Axis.horizontal,
        reverse: false,
        children: <Widget>[
          Container(
              color: Colors.red,
              width: 50.0,
              height: 50.0,
              child: Text('标题1', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.yellow,
              width: 50.0,
              height: 50.0,
              child: Text('标题2', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.green,
              width: 50.0,
              height: 50.0,
              child: Text('标题3', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.blue,
              width: 50.0,
              height: 50.0,
              child: Text('标题4', style: TextStyle(color: Color(0xffffffff)))),
          Container(
              color: Colors.teal,
              width: 50.0,
              height: 50.0,
              child: Text('标题5', style: TextStyle(color: Color(0xffffffff))))
        ],
      )
    ],
  );
}

Widget listBody2() {
  return Column(
    children: <Widget>[
      ///主轴空间不能受限，ListBody不会裁剪child
      ///指定轴尺寸正常，另一个轴尺寸会拉伸
      ///使用时最外层控件布局要有全屏特性，Column，Row，ListView，Flex,SingleChildScrollView
      ListBody(
        mainAxis: Axis.vertical,
        reverse: false,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.yellow,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.green,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.blue,
            width: 20.0,
            height: 50.0,
          ),
          Container(
            color: Colors.black,
            width: 20.0,
            height: 50.0,
          ),
        ],
      ),
      Container(
        color: Colors.teal,
        width: 100.0,
        height: 50.0,
      ),
      Container(
        color: Colors.orange,
        width: 100.0,
        height: 50.0,
      ),
      Container(
        color: Colors.amber,
        width: 100.0,
        height: 50.0,
      ),
    ],
  );
}
