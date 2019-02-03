import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fluttersamples/widgets/ToolBar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SecondTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondTabState();
  }
}

class SecondTabState extends State<SecondTab> {
  @override
  void initState() {
    super.initState();
    get();
  }

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

  get() async {
    // var responseBody;
    // var url = 'http://192.168.1.130:8092/a/ab';
    // var httpClient = new HttpClient();
    // var request = await httpClient.getUrl(Uri.parse(url));
    // var response = await request.close();
    // if (response.statusCode == 200) {
    //   responseBody = await response.transform(utf8.decoder).join();
    //   responseBody = JSON.decode(responseBody);
    // } else {
    //   print("error");
    // }
    // await responseBody['msg'].map((Map item) {
    //   newTitle.add(item);
    // }).toList();
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
