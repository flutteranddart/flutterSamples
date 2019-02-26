/*
 * @Author: Tan Dong 
 * @Date: 2019-02-26 21:12:00 
 * @Last Modified by: Tan Dong
 * @Last Modified time: 2019-02-26 21:13:22
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollViewSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollViewSamplesState();
  }
}

class ScrollViewSamplesState extends State<ScrollViewSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollView'),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return Container(height: 1, color: Colors.pink);
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              isThreeLine: true,
              dense: true,
              leading: ExcludeSemantics(
                  child: CircleAvatar(child: Text("CircleAvatar"))),
              title: Text('This item represents .'),
              subtitle: Text("subtitle"),
              trailing:
                  Icon(Icons.info, color: Theme.of(context).disabledColor),
            );
          },
        ),
      ),
    );
  }
}
