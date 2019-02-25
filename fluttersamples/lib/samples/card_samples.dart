/*
 * @Author: Tan Dong 
 * @Date: 2019-02-25 20:34:07 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-25 20:34:07 
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
  return Card(
    child: Text(
      'Card',
    ),
  );
}

Widget card2() {
  return Center(
    child: Card(
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
  );
}
