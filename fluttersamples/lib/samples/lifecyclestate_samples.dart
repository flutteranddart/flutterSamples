/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:29:48 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:29:48 
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LifeCycleStateSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LifeCycleStateSamplesState();
  }
}

class LifeCycleStateSamplesState extends State<LifeCycleStateSamples>
    with WidgetsBindingObserver {
  ///插入渲染树时调用，只调用一次
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  ///构建Widget时调用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LifeCycleState'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  ///state依赖的对象发生变化时调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  ///组件状态改变时候调用，可能会调用多次
  @override
  void didUpdateWidget(LifeCycleStateSamples oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  ///当移除渲染树的时候调用
  @override
  void deactivate() {
    super.deactivate();
  }

  ///组件即将销毁时调用
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  ///APP生命周期监听
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ///恢复可见
    } else if (state == AppLifecycleState.paused) {
      ///处在并不活动状态，无法处理用户响应
      ///例如来电，画中画，弹框
    } else if (state == AppLifecycleState.inactive) {
      ///不可见，后台运行，无法处理用户响应
    } else if (state == AppLifecycleState.suspending) {
      ///应用被立刻暂停
    }
    super.didChangeAppLifecycleState(state);
  }
}
