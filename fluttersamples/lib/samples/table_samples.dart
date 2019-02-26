/*
 * @Author: Tan Dong 
 * @Date: 2019-02-26 21:11:44 
 * @Last Modified by: Tan Dong
 * @Last Modified time: 2019-02-26 21:12:14
 */
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
        child: table4(),
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

Widget table3() {
  return DataTable(
    ///行
    rows: <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('data1'), onTap: onTap),
          DataCell(Text('data2'), onTap: onTap),
          DataCell(Text('data3'), onTap: onTap),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('data1'), onTap: onTap),
          DataCell(Text('data2'), onTap: onTap),
          DataCell(Text('data3'), onTap: onTap),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('data1'), onTap: onTap),
          DataCell(Text('data2'), onTap: onTap),
          DataCell(Text('data3'), onTap: onTap),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('data1'), onTap: onTap),
          DataCell(Text('data2'), onTap: onTap),
          DataCell(Text('data3'), onTap: onTap),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('data1'), onTap: onTap),
          DataCell(Text('data2'), onTap: onTap),
          DataCell(Text('data3'), onTap: onTap),
        ],
      ),
    ],

    ///列
    columns: <DataColumn>[
      DataColumn(label: Text('DataColumn1')),
      DataColumn(label: Text('DataColumn2')),
      DataColumn(label: Text('DataColumn3')),
    ],
  );
}

TableDataSource _dataSource = TableDataSource();

Widget table4() {
  return ListView(
    padding: EdgeInsets.all(10),
    children: <Widget>[
      PaginatedDataTable(
        source: _dataSource,

        ///默认为0
        initialFirstRowIndex: 0,

        ///默认为10
        rowsPerPage: 6,
        onSelectAll: (bool checked) {
          _dataSource.selectAll(checked);
        },
        header: Text('data header'),
        columns: <DataColumn>[
          DataColumn(label: Text('DataColumn1')),
          DataColumn(label: Text('DataColumn2')),
        ],
      ),
    ],
  );
}

class Shop {
  final String name;
  final int price;

  ///默认为未选中
  bool selected = false;
  Shop(this.name, this.price);
}

class TableDataSource extends DataTableSource {
  final List<Shop> shops = <Shop>[
    Shop('name', 100),
    Shop('name2', 130),
  ];
  int _selectedCount = 0;

  ///根据位置获取内容行
  @override
  DataRow getRow(int index) {
    Shop shop = shops.elementAt(index);
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(
            Text('${shop.name}'),
            placeholder: true,
          ),
          DataCell(Text('${shop.price}'), showEditIcon: true),
        ],
        selected: shop.selected,
        index: index,
        onSelectChanged: (bool isSelected) {
          if (shop.selected != isSelected) {
            _selectedCount += isSelected ? 1 : -1;
            shop.selected = isSelected;
            notifyListeners();
          }
        });
  }

  @override

  ///行数是否不确定
  bool get isRowCountApproximate => false;

  @override

  ///行数
  int get rowCount => shops.length;

  @override

  ///选中的行数
  int get selectedRowCount => _selectedCount;

  void selectAll(bool checked) {
    for (Shop shop in shops) {
      shop.selected = checked;
    }
    _selectedCount = checked ? shops.length : 0;
    notifyListeners();
  }
}

void onTap() {
  print('data onTap');
}
