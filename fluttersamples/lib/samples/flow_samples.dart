/*
 * @Author: Tan Dong 
 * @Date: 2019-02-25 20:34:17 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-25 20:34:17 
 */
import 'package:flutter/widgets.dart';

class FlowSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlowSamplesState();
  }
}

class FlowSamplesState extends State<FlowSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: SampleFlowDelegate(),
      children: <Widget>[],
    );
  }
}

class SampleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {}

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
