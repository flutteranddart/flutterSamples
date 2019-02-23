/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:07 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:07 
 */
import 'package:flutter/material.dart';
import 'package:fluttersamples/samples/table_samples.dart';
import 'package:fluttersamples/widgets/ToolBar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtherTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtherTabState();
  }
}

class OtherTabState extends State<OtherTab> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getItem(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Samples"),
      ),
      body: Scaffold(
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0, //竖向间距
          crossAxisCount: 2, //横向Item的个数
          crossAxisSpacing: 8.0, //横向间距
          children: widgets,
        ),
      ),
    );
  }

  Widget getItem(int i) {
    return new GestureDetector(
      child: new Padding(
        padding: new EdgeInsets.all(10.0),
      ),
      onTap: () {
        toPage();
      },
      onLongPress: showToast,
    );
  }

  void toPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TableSamples();
    }));
    // Navigator.push(
    //     context,
    //     PageRouteBuilder(pageBuilder: (BuildContext context,
    //         Animation<double> animation, Animation<double> secondaryAnimation) {
    //       return new DetailPage();
    //     }, transitionsBuilder: (
    //       BuildContext context,
    //       Animation<double> animation,
    //       Animation<double> secondaryAnimation,
    //       Widget child,
    //     ) {
    //       return SlideTransition(
    //           position: new Tween<Offset>(
    //             begin: const Offset(1.0, 0.0),
    //             end: const Offset(0.0, 0.0),
    //           ).animate(animation),
    //           child: child);
    //     }));
    // Navigator.push(
    //     context, new MaterialPageRoute(builder: (context) => new DetailView()));
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
