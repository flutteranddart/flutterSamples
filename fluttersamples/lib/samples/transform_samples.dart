/*
 * @Author: Tan Dong 
 * @Date: 2019-03-08 20:24:49 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-03-08 20:24:49 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class TransformSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransformSamplesState();
  }
}

class TransformSamplesState extends State<TransformSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: transform1(),
          ),
        ],
      ),
    );
  }

  Widget transform1() {
    return Column(
      children: <Widget>[
        Transform(
          transform: Matrix4.rotationZ(0.3),
          child: Container(
            width: 30,
            height: 30,
            color: Colors.teal,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Transform.rotate(
          angle: -math.pi / 12.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Apartment for rent!'),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Transform.translate(
          offset: const Offset(0.0, 15.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFF7F7F7F),
            child: const Text('Quarter'),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Transform.scale(
          scale: 0.5,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Bad Ideas'),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: const Text('Hello World!'),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 200,
          height: 100,
          color: Colors.orange,
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: const Card(child: Text('Hello World!')),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 100,
          child: AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Container(
              width: 160,
              color: Colors.orange,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('AH')),
              label: Text('Hamilton'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('ML')),
              label: Text('Lafayette'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('HM')),
              label: Text('Mulligan'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('JL')),
              label: Text('Laurens'),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
