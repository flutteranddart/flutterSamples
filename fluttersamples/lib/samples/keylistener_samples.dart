/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:45 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:45 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class KeyListenerSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KeyListenerSamplesState();
  }
}

class KeyListenerSamplesState extends State<KeyListenerSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return keyListener1();
  }
}

Widget keyListener1() {
  FocusNode _focusNode = new FocusNode();

  // Future<Null> _focusNodeListener() async {
  //   if (_focusNode.hasFocus) {
  //     print('TextField got the focus');
  //   } else {
  //     print('TextField lost the focus');
  //   }
  // }

  // _focusNode.addListener(_focusNodeListener);

  TextEditingController controller =
      TextEditingController(text: 'TextEditingController');

  return RawKeyboardListener(
    child: Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Text(
            'data',
            style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
          ),
          TextField(
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'TextField...',
            ),
          ),
          EditableText(
            controller: controller,
            focusNode: _focusNode,
            cursorColor: Colors.teal,
            style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
          ),
          Text.rich(TextSpan(text: 'TextSpan')),
        ],
      )),
    ),
    focusNode: _focusNode,
    onKey: onKeyBoardEvent,
  );
}

void onKeyBoardEvent(RawKeyEvent event) {
  print('监听');
  FocusNode requestingNode = FocusNode();
  if (event is RawKeyDownEvent && event.data is RawKeyEventDataAndroid) {
    print('keydown');
    RawKeyDownEvent ev = event;
    RawKeyEventDataAndroid evAndroid = ev.data;
    print(evAndroid.keyCode);
  }
}
