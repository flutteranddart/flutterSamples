import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormSamplesState();
  }
}

class FormSamplesState extends State<FormSamples> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            ///TextFormField主要用于Form表单，TextField普通输入框
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              onSaved: (String value) {
                _name = value;
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'TextFormField'),
              maxLines: 1,
              maxLength: 32,
              keyboardType: TextInputType.numberWithOptions(),
              validator: (value) {},
              onSaved: (value) {
                _password = value;
              },
              onFieldSubmitted: (value) {},
            ),

            ///被Tooltip包裹的控件长按弹出tips
            Tooltip(
              message: '表单提交',
              child: RaisedButton(
                child: Text('确定'),
                onPressed: () {
                  onSubmit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("提示"),
              content: Column(
                children: <Widget>[
                  Text(
                    'Name: $_name',
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.none),
                  ),
                  Text(
                    'Password: $_password',
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.none),
                  ),
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定")),
              ],
            );
          });
    }
  }
}
