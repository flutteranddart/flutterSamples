/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:04 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:04 
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersamples/ui/list_page.dart';
import 'package:fluttersamples/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeTabState();
  }
}

class HomeTabState extends State<HomeTab> {
  List widgets = [];
  List strings = [];
  List icons = [];
  @override
  void initState() {
    super.initState();
    initList();
    for (int i = 0; i < 8; i++) {
      widgets.add(getItem(i));
    }
    widgets.length = 8;
    Utils().getBatteryLevel().then((string) {
      print(string);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.widgets),
        title: Text('Flutter Samples'),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int position) {
            return widgets.elementAt(position);
          },
          itemCount: widgets.length,
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showToast('刷新完成');
        return null;
      });
    });
  }

  Widget getItem(int i) {
    return FlatButton(
      onPressed: () {
        gotoPage(i);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icons.elementAt(i),
            size: 30,
          ),
          Text(strings.elementAt(i)),
        ],
      ),
    );
  }

  void initList() {
    strings.add("Base Widgets");
    strings.add("Material");
    strings.add("Cupertino");
    strings.add("Style");
    strings.add("Animation");
    strings.add("Services");
    strings.add("Gestures");
    strings.add("Samples");
    strings.length = 8;
    icons.add(Icons.widgets);
    icons.add(Icons.android);
    icons.add(Icons.phone_iphone);
    icons.add(Icons.style);
    icons.add(Icons.rotate_90_degrees_ccw);
    icons.add(Icons.local_laundry_service);
    icons.add(Icons.gesture);
    icons.add(Icons.smartphone);
  }

  void gotoPage(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ListPage(index:index);
    }));
  }

  void showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.grey,
        fontSize: 16.0);
  }

  void copyFile() {
    // var systemTempDir = Directory('sdcard');
    var file = File('sdcard/flutter.png');
    file.exists().then((isThere) {
      if (!isThere) {
        File uriFile = File.fromUri(Uri.parse('assets/flutter.png'));
        File fileAssets = File('assets/flutter.png');
        uriFile.exists().then((isExists) {
          print(isExists);
        });
        fileAssets.copy('sdcard/flutter.png');
        print('copy');
      }
    });
  }
}
