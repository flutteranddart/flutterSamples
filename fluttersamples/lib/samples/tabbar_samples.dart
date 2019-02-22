/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:53 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:53 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarSamplesState();
  }
}

class TabBarSamplesState extends State<TabBarSamples>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return tabBar1();
  }

  Widget tabBar1() {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Tab1",
            ),
            Tab(
              text: "Tab2",
            ),
            Tab(
              text: "Tab3",
            ),
            Tab(
              text: "Tab4",
            ),
            Tab(
              text: "Tab5",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text("data1"),
          ),
          Center(
            child: Text("data2"),
          ),
          Center(
            child: Text("data3"),
          ),
          Center(
            child: Text("data4"),
          ),
          Center(
            child: Text("data5"),
          ),
        ],
      ),
    );
  }
}
