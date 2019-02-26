/*
 * @Author: Tan Dong 
 * @Date: 2019-02-26 21:12:27 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-26 21:12:27 
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopMenuSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PopMenuSamplesState();
  }
}

class PopMenuSamplesState extends State<PopMenuSamples> {
  final _checkedValue1 = '_checkedValue1';
  final _checkedValue2 = '_checkedValue2';
  final _checkedValue3 = '_checkedValue3';
  final _checkedValue4 = '_checkedValue4';
  List<String> _checkedValues;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _checkedValues = <String>[_checkedValue3];
  }

  @override
  Widget build(BuildContext context) {
    double x = 0;
    double y = 0;
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('PopMenu'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // ...
            },
          ),
          PopupMenuButton<String>(
            onSelected: (string) {},
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: 'Menu1Value',
                  child: Text('Menu1'),
                ),
                const PopupMenuItem(
                  value: 'Menu2Value',
                  child: Text('Menu2'),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          //点击item右侧按钮弹出PopMenu
          ListTile(
              title: const Text('An item with a context menu button'),
              trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: (string) {},
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                            value: 'Context Menu Value1',
                            child: const Text('Context menu item one')),
                        const PopupMenuItem<String>(
                            enabled: false,
                            child: Text('A disabled menu item')),
                        PopupMenuItem<String>(
                            value: 'Context Menu Value3',
                            child: const Text('Context menu item three')),
                      ])),
          //有分割线的PopMenu
          ListTile(
              title: const Text('An item with a sectioned menu'),
              trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: (string) {},
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                            value: 'Preview',
                            child: ListTile(
                                leading: Icon(Icons.visibility),
                                title: Text('Preview'))),
                        const PopupMenuItem<String>(
                            value: 'Share',
                            child: ListTile(
                                leading: Icon(Icons.person_add),
                                title: Text('Share'))),
                        const PopupMenuItem<String>(
                            value: 'Get Link',
                            child: ListTile(
                                leading: Icon(Icons.link),
                                title: Text('Get link'))),
                        //默认高度16像素
                        const PopupMenuDivider(),
                        const PopupMenuItem<String>(
                            value: 'Remove',
                            child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Remove')))
                      ])),
          // 点击item弹出PopupMenu，最外层PopupMenuButton包裹
          PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              initialValue: '初始值',
              onSelected: (string) {},
              child: ListTile(
                  title: const Text('An item with a simple menu'),
                  subtitle: Text('subtitle')),
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                        value: 'PopupMenuValue1', child: Text('PopupMenu1')),
                    PopupMenuItem<String>(
                        value: 'PopupMenuValue2', child: Text('PopupMenu2')),
                    PopupMenuItem<String>(
                        value: 'PopupMenuValue3', child: Text('PopupMenu3'))
                  ]),
          // 带多选按钮PopMenu
          ListTile(
              title: const Text('An item with a checklist menu'),
              trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: (string) {
                    showCheckMenuAction(string);
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                        CheckedPopupMenuItem<String>(
                            value: _checkedValue1,
                            checked: isChecked(_checkedValue1),
                            child: Text('CheckedPopupMenu1')),
                        CheckedPopupMenuItem<String>(
                            value: _checkedValue2,
                            enabled: false,
                            checked: isChecked(_checkedValue2),
                            child: Text('CheckedPopupMenu2')),
                        CheckedPopupMenuItem<String>(
                            value: _checkedValue3,
                            checked: isChecked(_checkedValue3),
                            child: Text('CheckedPopupMenu3')),
                        CheckedPopupMenuItem<String>(
                            value: _checkedValue4,
                            checked: isChecked(_checkedValue4),
                            child: Text('CheckedPopupMenu4'))
                      ])),
          //普通Button点击弹出PopupMenu,通过showMenu
          SizedBox(
            height: 200,
          ),
          GestureDetector(
            onPanDown: (DragDownDetails details) {
              x = details.globalPosition.dx;
              y = details.globalPosition.dy;
            },
            onLongPress: () async {
              if (Platform.isAndroid) {
                await showMenu(
                    context: context,
                    items: [
                      PopupMenuItem(
                        child: Text("删除"),
                        value: 'ItemType.delete',
                      )
                    ],
                    position: RelativeRect.fromLTRB(
                        x, y - 50, MediaQuery.of(context).size.width - x, 0));
              }
            },
            child: RaisedButton(
              onPressed: () {
                final RenderBox button = context.findRenderObject();
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject();
                showMenu(
                    context: context,
                    position: RelativeRect.fromRect(
                      Rect.fromPoints(
                        button.localToGlobal(button.size.center(Offset.zero),
                            ancestor: overlay),
                        button.localToGlobal(button.size.center(Offset.zero),
                            ancestor: overlay),
                      ),
                      Offset.zero & overlay.size,
                    ),
                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Text('PopupMenuItem1'),
                        value: 'PopupMenuValue1',
                      ),
                      PopupMenuItem(
                        child: Text('PopupMenuItem2'),
                        value: 'PopupMenuValue2',
                      ),
                      PopupMenuItem(
                        child: Text('PopupMenuItem3'),
                        value: 'PopupMenuValue3',
                      ),
                    ]);
              },
              child: Text('showMenu'),
            ),
          ),
        ],
      ),
    );
  }

  bool isChecked(String value) {
    return _checkedValues.contains(value);
  }

  void showCheckMenuAction(String value) {
    if (_checkedValues.contains(value)) {
      _checkedValues.remove(value);
    } else {
      _checkedValues.add(value);
    }
    _globalKey.currentState.showSnackBar(SnackBar(
      content: Text('Checked $_checkedValues'),
    ));
  }
}
