import 'package:flutter/material.dart';
import 'package:fluttersamples/widgets/ToolBar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtherTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtherTabState();
  }
}

class OtherTabState extends State<OtherTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        child: Text("title"),
      ),
      body: RaisedButton(
        child: Text("data"),
        onPressed: showToast,
      ),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}