import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersamples/samples/button_samples.dart';
import 'package:fluttersamples/samples/image_samples.dart';
import 'package:fluttersamples/samples/text_samples.dart';

int index = 0;

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }

  ListPage({index});
}

List<ListItem> _items;
double iconSize = 25;
double titleSize = 16;
double descriptionSize = 12;

class ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return _getListView();
  }

  List<ListItem> getList() {
    _items = new List();
    _items.add(ListItem(
      title: 'Text',
      description: 'Text',
      icon: Icon(
        Icons.text_fields,
        color: Color(0xff003d74),
        size: iconSize,
      ),
    ));
    _items.add(ListItem(
        title: 'Image',
        description: 'Image',
        icon: Icon(
          Icons.image,
          color: Color(0xff003d74),
          size: iconSize,
        )));
    _items.add(ListItem(
        title: 'Button',
        description: 'Button',
        icon: Icon(
          Icons.description,
          color: Color(0xff003d74),
          size: iconSize,
        )));
    _items.length = 3;
    return _items;
  }
}

Widget _getListView() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Base Widgets'),
    ),
    body: ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int position) {
        return getItem(context, position);
      },
    ),
  );
}

Widget getItem(BuildContext context, int i) {
  return FlatButton(
      onPressed: () {
        gotoPage(context, i);
      },
      splashColor: Colors.lightBlue[50],
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            _items.elementAt(i).icon,
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _items.elementAt(i).title,
                  style: TextStyle(
                      fontSize: titleSize,
                      color: Color(0xff202125),
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  _items.elementAt(i).description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: descriptionSize,
                      color: Color(0xff60656b),
                      fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],
        ),
      ));
}

class ListItem {
  String title;
  String description;
  Icon icon;
  ListItem({
    this.title,
    this.description,
    this.icon,
  });
}

void gotoPage(BuildContext context, int position) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    switch (index) {

      ///Base Widgets
      case 0:
        if (position == 0) {
          return TextSamples();
        } else if (position == 1) {
          return ImageSamples();
        } else if (position == 2) {
          return ButtonSamples();
        }
        break;

      ///Material
      case 1:
        break;
      default:
    }
    return ListPage(index: index);
  }));
}
