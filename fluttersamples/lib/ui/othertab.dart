import 'package:flutter/material.dart';
import 'package:flutter_tv/samples/table_samples.dart';
import 'package:flutter_tv/widgets/ToolBar.dart';
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
      appBar: ToolBar(
        child: Text("title"),
      ),
      body: Scaffold(
          body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0, //竖向间距
          crossAxisCount: 2, //横向Item的个数
          crossAxisSpacing: 8.0, //横向间距
          children: widgets,
        ),
      )),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        print('refresh');
        for (int i = 0; i < 50; i++) {
          widgets.add(getItem(i));
        }
        return null;
      });
    });
  }

  Widget getItem(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.asset("assets/img_welcome.jpg"),
              Image.network(
                  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,3408544765&fm=27&gp=0.jpg"),
              Text(
                "row $i",
                style: TextStyle(color: Colors.pink),
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.cyan,
                valueColor: AlwaysStoppedAnimation(Colors.yellow),
                semanticsLabel: 'label',
                semanticsValue: 'value',
              ),
              Padding(
                child: LinearProgressIndicator(
                  semanticsLabel: 'label',
                  semanticsValue: 'value',
                  backgroundColor: Colors.deepPurple,
                ),
                padding: EdgeInsets.all(8),
              ),
            ],
          )),
      onTap: () {
        toPage();
      },
      onLongPress: showToast,
    );
  }

  void toPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TablePage();
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
