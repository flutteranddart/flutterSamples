import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/widgets/ToolBar.dart';

class TablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TablePageState();
  }
}

class TablePageState extends State<TablePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const width = 80.0;
    const height = 60.0;
    return Scaffold(
        appBar: ToolBar(child: Text("标题")),
        body:Flow(
              delegate:
                  PageFlowDelegate(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)),
              children: <Widget>[
                new Container(
                  width: width,
                  height: height,
                  color: Colors.yellow,
                ),
                new Container(
                  width: width,
                  height: height,
                  color: Colors.green,
                ),
                new Container(
                  width: width,
                  height: height,
                  color: Colors.red,
                ),
                new Container(
                  width: width,
                  height: height,
                  color: Colors.black,
                ),
                new Container(
                  width: width,
                  height: height,
                  color: Colors.blue,
                ),
                new Container(
                  width: width,
                  height: height,
                  color: Colors.lightGreenAccent,
                ),
              ],
            ), 
        // Column(
        //   children: <Widget>[
        //     // Padding(
        //     //     padding: EdgeInsets.all(10),
        //     //     child: Card(
        //     //       color: Colors.white30,
        //     //       elevation: 2,
        //     //       child: Image.asset("assets/img_welcome.jpg"),
        //     //     )),
            
        //     // Table(
        //     //   // columnWidths: const {
        //     //   //   0: FixedColumnWidth(50.0),
        //     //   //   1: FixedColumnWidth(100.0),
        //     //   //   2: FixedColumnWidth(50.0),
        //     //   //   3: FixedColumnWidth(100.0),
        //     //   // },
        //     //   border: TableBorder.all(
        //     //       color: Colors.pink, width: 1, style: BorderStyle.solid),
        //     //   children: const [
        //     //     TableRow(
        //     //       children: [
        //     //         Text('A1'),
        //     //         Text('B1'),
        //     //         Text('C1'),
        //     //         Text('D1'),
        //     //       ],
        //     //     ),
        //     //     TableRow(
        //     //       children: [
        //     //         Text('A2'),
        //     //         Text('B2'),
        //     //         Text('C2'),
        //     //         Text('D2'),
        //     //       ],
        //     //     ),
        //     //     TableRow(
        //     //       children: [
        //     //         Text('A3'),
        //     //         Text('B3'),
        //     //         Text('C3'),
        //     //         Text('D3'),
        //     //       ],
        //     //     ),
        //     //   ],
        //     // ),
        //   ],
        // )
        );
  }
}

class PageFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  PageFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
