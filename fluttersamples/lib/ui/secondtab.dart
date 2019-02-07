import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttersamples/widgets/ToolBar.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class SecondTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondTabState();
  }
}

class SecondTabState extends State<SecondTab> {
  @override
  void initState() {
    super.initState();
    getHttpClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        child: Text("title"),
      ),
      body: RaisedButton(
        child: Text("data"),
        onPressed: showToast,
      ),
    );
  }

  postHttpClient() async {
    var url = "http://192.168.1.130:8092/a/r";
    var httpClient = new HttpClient();
    httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      // Optionally set up headers...
      // Optionally write to the request object...
      // Then call close.
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
    ;
  }

  getHttpClient() async {
    var url = "http://192.168.1.130:8092/a/ab";
    var httpClient = new HttpClient();
    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      // Optionally set up headers...
      // Optionally write to the request object...
      // Then call close.
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });

    // var response = await request.close();
    // //判断是否请求成功
    // if (response.statusCode == 200) {
    //   //拿到请求的数据
    //   responseBody = await response.transform(utf8.decoder).join();
    //   print(responseBody);
    //   //解析json，拿到对应的jsonArray数据
    //   // var convertDataToJson = jsonDecode(responseBody)["data"]["datas"];
    //   //更新数据
    //   // setState(() {
    //   //   data = convertDataToJson;
    //   // });

    // } else {
    //   print("error");
    // }
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