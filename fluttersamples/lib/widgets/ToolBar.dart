/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:33 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:28:33 
 */
import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget implements PreferredSizeWidget {
  ToolBar({@required this.child}) : assert(child != null);

  final Widget child;

  @override
  Size get preferredSize {
    return new Size.fromHeight(56.0);
  }

  @override
  State createState() {
    return new ToolBarState();
  }
}

class ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: widget.child,
    );
  }
}
