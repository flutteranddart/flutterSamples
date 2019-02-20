import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextSamplesState();
  }
}

class TextSamplesState extends State<TextSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return text1(context);
  }
}

Widget text1(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Text'),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          Text('data',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.none,
              )),
          Text.rich(TextSpan(
            text: 'TextSpan',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30.0,
              decoration: TextDecoration.none,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: '拼接1',
                style: new TextStyle(
                  color: Colors.teal,
                ),
              ),
              new TextSpan(
                text: '拼接2',
                style: new TextStyle(
                  color: Colors.black,
                ),
              ),
              new TextSpan(
                text: '拼接3',
                style: new TextStyle(
                  color: Colors.teal,
                ),
              ),
              new TextSpan(
                text: '拼接4',
                style: new TextStyle(
                  color: Colors.teal,
                ),
              ),
              new TextSpan(
                text: '拼接5',
                style: new TextStyle(
                  color: Colors.teal,
                ),
              ),
              new TextSpan(
                text: '拼接6',
                style: new TextStyle(
                  color: Colors.teal,
                ),
              ),
              new TextSpan(
                text: '拼接7',
                style: new TextStyle(
                  color: Colors.yellow,
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () {
                    //增加一个点击事件
                    print(
                        '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                  },
              ),
            ],
          )),
          RichText(
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'bold',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none)),
                TextSpan(
                    text: ' world!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none)),
              ],
            ),
          ),
          TextField(
            autofocus: false,
            keyboardType: TextInputType.text,
            onChanged: (newValue) {
              // print(newValue); // 当输入内容变更时,如何处理
            },
            onSubmitted: (value) {
              // print("whar"); // 当用户确定已经完成编辑时触发
            },
            decoration: InputDecoration(
                hintText: 'hintText...',
                labelText: "城市",
                icon: new Icon(Icons.location_city),
                border: new OutlineInputBorder(), // 边框样式
                helperText: 'required',
                prefixIcon: new Icon(Icons.android),
                prefixText: 'Hello'),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          )
        ],
      ),
    ),
  );
}
