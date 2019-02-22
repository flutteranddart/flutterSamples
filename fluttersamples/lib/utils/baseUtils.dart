/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:37 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:28:37 
 */
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseUtils {
  void showToast(String string) {
    Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
