import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/widgets/ToolBar.dart';

class ExpansionPanelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpansionPanelPageState();
  }
}

class ExpansionPanelPageState extends State<ExpansionPanelPage> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        child: Text("title"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              children: <ExpansionPanel>[
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Panel A',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: Text('Content for Panel A\n The Content'),
                  ),
                  isExpanded: _isExpanded,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Panel B',
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: Text('Content for Panel B\n The Content'),
                  ),
                  isExpanded: _isExpanded,
                )
              ],
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _isExpanded = !isExpanded;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
