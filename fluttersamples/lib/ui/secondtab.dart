/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:10 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:10 
 */
import 'package:flutter/material.dart';
import 'package:fluttersamples/samples/image_samples.dart';
import 'package:fluttersamples/utils/httpUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttersamples/utils/dialogUtils.dart';
import 'list_page.dart';

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
    HttpUtils().postHttpFileClient();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Samples"),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("data"),
                onPressed: () {
                  DialogUtils dialogUtils = DialogUtils();
                  dialogUtils.snackBar1(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageSamples();
                  }));
                },
              ),
            ],
          )),
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

  void showAlerDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("提示"),
            content: new Text("是否退出"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text("取消")),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text("确定"))
            ],
          );
        });
  }
}

class ListPage {
}
