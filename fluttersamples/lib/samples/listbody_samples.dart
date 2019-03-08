/*
 * @Author: Tan Dong 
 * @Date: 2019-03-08 20:24:01 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-08 20:24:01 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListBodySamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListBodySamplesState();
  }
}

class ListBodySamplesState extends State<ListBodySamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListBody'),
      ),
      body: listBody1(),
    );
  }
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
