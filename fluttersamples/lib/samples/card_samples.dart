/*
 * @Author: Tan Dong 
 * @Date: 2019-02-26 21:11:50 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-26 21:11:50 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CardSamplesState();
  }
}

class CardSamplesState extends State<CardSamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: card1(),
    );
  }
}

Widget card1() {
  return ListView(
    children: <Widget>[
      Card(
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Card',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Card(
        elevation: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Card(
        shape: CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Card',
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  );
}
