/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:30 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:30 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlexSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlexSamplesState();
  }
}

class FlexSamplesState extends State<FlexSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Flex布局
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex'),
      ),
      body: flex4(),
    );

    ///FlexibleSpaceBar集合CustomScrollView
    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverAppBar(
    //       pinned: true,
    //       title: Text('Flex'),
    //       expandedHeight: 200,
    //       flexibleSpace: new FlexibleSpaceBar(
    //         title: new Text("FlexibleSpaceBar"),
    //         centerTitle: true,
    //         collapseMode: CollapseMode.pin,
    //         background: Image.asset(
    //           "assets/flutter-mark-square-64.png",
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Image.asset(
    //         "assets/flutter-mark-square-64.png",
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Image.asset(
    //         "assets/flutter-mark-square-64.png",
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //       child: Image.asset(
    //         "assets/flutter-mark-square-64.png",
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ],
    // );
  }
}

Widget flex1() {
  return Flex(
    direction: Axis.horizontal,
    children: <Widget>[
      Container(
        color: Colors.orange,
        width: 50.0,
        height: 60.0,
        child: Center(
          child: const Text("left"),
        ),
      ),
      Container(
        color: Colors.pink,
        width: 80.0,
        height: 60.0,
        child: Center(
          child: const Text("middle"),
        ),
      ),
      Container(
        color: Colors.teal,
        width: 60.0,
        height: 60.0,
        child: Center(
          child: const Text("right"),
        ),
      ),
    ],
  );
}

///Flexible可设置占用比例和权重
Widget flex2() {
  return Flex(
    direction: Axis.horizontal,

    ///主轴对齐
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

    ///横轴对齐
    crossAxisAlignment: CrossAxisAlignment.center,

    ///伸展大小
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Flexible(
        fit: FlexFit.loose,
        flex: 3,
        child: Container(
          color: Colors.orange,
          height: 60.0,
          child: Center(
            child: const Text("left"),
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.loose,
        flex: 2,
        child: Container(
          color: Colors.pink,
          height: 60.0,
          child: Center(
            child: const Text("middle"),
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: Container(
          color: Colors.teal,
          height: 60.0,
          child: Center(
            child: const Text("right"),
          ),
        ),
      ),
    ],
  );
}

///Expanded占用剩余空间
Widget flex3() {
  return Flex(
    direction: Axis.horizontal,
    children: <Widget>[
      Container(
        color: Colors.orange,
        width: 50.0,
        height: 60.0,
        child: Center(
          child: const Text("left"),
        ),
      ),
      Expanded(
          child: Container(
        height: 60.0,
        color: Colors.pink,
        child: Center(
          child: const Text("Expanded"),
        ),
      )),
    ],
  );
}

Widget flex4() {
  return Flex(
    direction: Axis.horizontal,
    children: <Widget>[
      Container(
        color: Colors.orange,
        width: 50.0,
        height: 60.0,
        child: Center(
          child: const Text("left"),
        ),
      ),

      ///调节Widget间间距
      Spacer(
        flex: 1,
      ),
      Expanded(
          child: Container(
        color: Colors.pink,
        child: Center(
          child: const Text("Expanded"),
        ),
      )),
    ],
  );
}
