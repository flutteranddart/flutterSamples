import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TableSamplesState();
  }
}

class TableSamplesState extends State<TableSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Table")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: table2(),
      ),
    );
  }
}

Widget table1() {
  return Table(
    border: TableBorder.all(color: Colors.teal, width: 1),
    children: <TableRow>[
      TableRow(children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Text('Title1'),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Text('Title2'),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Text('Title3'),
          ),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
        TableCell(
          child: Text('data'),
        ),
      ]),
    ],
  );
}

Widget table2() {
  return Table(
    columnWidths: const {
      ///固定列宽度
      0: FixedColumnWidth(50),

      ///弹性列宽度
      1: FlexColumnWidth(1),

      ///宽度占所在容器的百分比（0-1）
      2: FractionColumnWidth(0.5),
      3: IntrinsicColumnWidth(flex: 0.2),
      4: MaxColumnWidth(
          const FixedColumnWidth(100.0), FractionColumnWidth(0.1)),

      ///大于容器10%宽度，但小于等于100px
      5: MinColumnWidth(
          const FixedColumnWidth(100.0), FractionColumnWidth(0.1)),
    },
    border: TableBorder.all(color: Colors.teal, width: 1),
    children: const <TableRow>[
      TableRow(children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Text('Title1'),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Text('Title2'),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Text('Title3'),
          ),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data1'),
        ),
        TableCell(
          child: Text('data2'),
        ),
        TableCell(
          child: Text('data3'),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data1'),
        ),
        TableCell(
          child: Text('data2'),
        ),
        TableCell(
          child: Text('data3'),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data1'),
        ),
        TableCell(
          child: Text('data2'),
        ),
        TableCell(
          child: Text('data3'),
        ),
      ]),
      TableRow(children: <Widget>[
        TableCell(
          child: Text('data1'),
        ),
        TableCell(
          child: Text('data2'),
        ),
        TableCell(
          child: Text('data3'),
        ),
      ]),
    ],
  );
}

Widget table3(){
  return Container();
}
