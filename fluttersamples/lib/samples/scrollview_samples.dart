import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollViewSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollViewSamplesState();
  }
}

class ScrollViewSamplesState extends State<ScrollViewSamples>
    with SingleTickerProviderStateMixin {
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
      body: scroll6(),
    );
  }
}

///Scrollbar
Widget scroll1() {
  return Scrollbar(
    child: ListView.separated(
      itemCount: 20,
      separatorBuilder: (BuildContext context, int index) {
        return Container(height: 1, color: Colors.black87);
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          isThreeLine: true,
          dense: true,
          leading:
              ExcludeSemantics(child: CircleAvatar(child: Text('leading'))),
          title: Text('This item represents .'),
          subtitle: Text('subtitle'),
          trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
        );
      },
    ),
  );
}

///SingleChildScrollView
Widget scroll2() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(
          // A fixed-height child.
          color: Colors.yellow,
          height: 620.0,
        ),
        Container(
          color: Colors.orange,
          height: 720.0,
        ),
      ],
    ),
  );
}

Widget scroll3(BuildContext context) {
  return ListWheelScrollView(
    clipToSize: true,
    itemExtent: 500, //MediaQuery.of(context).size.height * 0.08
    children: <Widget>[
      Text('data1'),
      Text('data2'),
      Text('data3'),
      Text('data4'),
      Text('data5'),
      Text('data6'),
      // Container(
      //   // A fixed-height child.
      //   color: Colors.yellow,
      //   height: 100.0,
      // ),
      // Container(
      //   color: Colors.orange,
      //   height: 100.0,
      // ),
      // Container(
      //   color: Colors.orange,
      //   height: 100.0,
      // ),
    ],
  );
}

Widget scroll4(BuildContext context) {
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool bodyIsScrolled) {
      return <Widget>[
        SliverOverlapAbsorber(
          child: SliverAppBar(
            title: Text('title'),
            pinned: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('FlexibleSpaceBar'),
            ),
          ),
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
      ];
    },
    body: SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.orange,
                  child: Text(
                    'data2',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

Widget scroll5() {
  return CustomMultiChildLayout(
    delegate: MultiChildDelegate(),
    children: <Widget>[
      LayoutId(
        id: MultiChildDelegate.title,
        child: Container(
          color: Colors.teal,
          child: Text('data1'),
        ),
      ),
      LayoutId(
        id: MultiChildDelegate.description,
        child: Container(
          color: Colors.amber,
          child: Text('data2'),
        ),
      ),
    ],
  );
}

class MultiChildDelegate extends MultiChildLayoutDelegate {
  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    ///约束
    BoxConstraints boxConstraints = BoxConstraints(maxWidth: size.width);

    ///绑定约束
    Size titleSize = layoutChild(title, boxConstraints);

    ///位置
    positionChild(title, Offset(0, 0));
    Size descriptionSize = layoutChild(description, boxConstraints);
    double descriptionY = titleSize.height;
    positionChild(description, Offset(10, descriptionY));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return oldDelegate == this;
  }
}

Widget scroll6() {
  return CustomSingleChildLayout(
    delegate: SingleChildDelegate(Size(300, 200)),
    child: Container(
      color: Colors.teal,
      child: Text('data'),
    ),
  );
}

class SingleChildDelegate extends SingleChildLayoutDelegate {
  Size size;
  SingleChildDelegate(this.size);

  @override
  Size getSize(BoxConstraints constraints) {
    // return super.getSize(constraints);
    return size;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // return super.getConstraintsForChild(constraints);
    return BoxConstraints.tight(size);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // return super.getPositionForChild(size, childSize);
    return Offset(30, 20);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return oldDelegate == this;
  }
}
