/*
 * @Author: Tan Dong 
 * @Date: 2019-03-12 22:25:15 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-12 22:25:15 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebViewSamplesState();
  }
}

class WebViewSamplesState extends State<WebViewSamples> {
  @override
  Widget build(BuildContext context) {
    return webview2();
  }

  Widget webview1() {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      url: 'https://www.baidu.com',
      withJavascript: true,
    );
  }

  Widget webview2() {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: RaisedButton(
        onPressed: () {
          var webviewPlugin = FlutterWebviewPlugin();
          webviewPlugin.launch('https://www.baidu.com');
        },
        child: Text('WebView'),
      ),
    );
  }
}
