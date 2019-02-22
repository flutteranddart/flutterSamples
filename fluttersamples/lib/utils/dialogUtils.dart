/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:40 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:28:40 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersamples/utils/baseUtils.dart';
import 'package:fluttersamples/widgets/LoadingDialog.dart';

enum Option { A, B, C }
enum Location { Barbados, Bahamas, Bermuda }

class DialogUtils extends BaseUtils {
  void main() {}

  ///AlertDialog
  Future<void> dialog1(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
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

  ///AlertDialog
  Future<void> officialDialog2(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ///SimpleDialog
  Future<void> dialog3(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("提示"),
          );
        });
  }

  ///SimpleDialog

  Future<void> dialog4(BuildContext context) async {
    switch (await showDialog<Option>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Answer'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
                child: const Text('A'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
                child: const Text('B'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
                child: const Text('C'),
              ),
            ],
          );
        })) {
      case Option.A:
        // Let's go.
        // ...
        print('A');
        break;
      case Option.B:
        // ...
        print('B');
        break;
      case Option.C:
        // ...
        print('C');
        break;
    }
  }

  ///自定义Dialog
  Future<void> dialog5(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog(text: '正在加载...');
        });
  }

  ///BottomSheet全透明背景的
  Future<void> bottomSheet1(BuildContext context) async {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {
              showToast('关闭');
            },
            elevation: 1,
            enableDrag: true,
            builder: (context) {
              return BottomAppBar(
                child: Container(
                  height: 90.0,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.pause_circle_outline,
                      ),
                      SizedBox(width: 16.0),
                      Text('01:30 / 03:30'),
                      Expanded(
                        child: Text('Fix you - Coldplay',
                            textAlign: TextAlign.right),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  ///ModalBottomSheet半透明背景的，显示在底部
  Future<void> modalBottomSheet1(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {
            // showToast('关闭');
            print('close');
          },
          elevation: 2,
          enableDrag: true,
          builder: (context) {
            return Container(
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                        'This is the modal bottom sheet. Tap anywhere to dismiss.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 24.0))));
          },
        );
      },
    );
  }

  ///SnackBar
  Future<void> snackBar1(BuildContext context) async {
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('This is snackbar content'),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {
          showToast('click');
        },
      ),
    ));
  }

}
