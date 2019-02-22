/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:04 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:04 
 */
import 'package:flutter/material.dart';
import 'package:fluttersamples/utils/PageLocalizations.dart';
import 'package:fluttersamples/utils/utils.dart';
import 'package:fluttersamples/widgets/ToolBar.dart';
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

  @override
  void initState() {
    super.initState();
    initList();
    for (int i = 0; i < 18; i++) {
      widgets.add(getItem(i));
    }
    Utils().getBatteryLevel().then((string){
      print(string);
      showToast(string);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        child: Text("title" + PageLocalizations.of(context).titleBarTitle),
      ),
      body: Scaffold(
          body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(position);
          },
        ),
      )),
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
    if (i.isOdd) {
      return new Divider();
    }
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text(strings.elementAt(i))),
      onTap: () {
        setState(() {
          showToast(strings.elementAt(i));
          print('row $i');
        });
      },
      onLongPress: () {
        showToast(strings.elementAt(i));
      },
    );
  }

  void initList() {
    strings.add("Text相关");
    strings.add("Image相关");
    strings.add("ListView相关");
    strings.add("GridView相关");
    strings.add("Flow相关");
    strings.add("Table相关");
    strings.add("File相关");
    strings.add("Http相关");
    strings.add("WebView相关");
    strings.add("路由跳转相关");
    strings.add("Image相关");
    strings.add("Image相关");
    strings.add("Image相关");
    strings.add("Image相关");
    strings.add("Image相关");
    strings.add("Image相关");
    strings.add("Image相关");
    strings.add("Image相关");
  }

  void showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
