import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tv/ui/hometab.dart';
import 'package:flutter_tv/ui/othertab.dart';
import 'package:flutter_tv/ui/secondtab.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int last = 0;
  int index = 0;
  double size = 25.0;
  List<BottomNavigationBarItem> items = new List();
  List<Widget> pages = new List();
  var pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: getPageViewBody(),
        bottomNavigationBar: getCupertinoTabBar(),
      ),
    );
  }

  Future<bool> _onWillPop() {
    int now = DateTime.now().millisecondsSinceEpoch;
    print(now - last);
    if (now - last > 1000) {
      last = now;
      showToast("再按一次返回键退出");
      return Future.value(false); //不退出
    } else {
      return Future.value(true); //退出
    }
  }

  ///APP生命周期状态监听（前后台切换监听）
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {}
    print('生命周期：' + state.toString());
    showToast('生命周期：' + state.toString());
  }

  ///设备分辨率改变调用，如旋转屏幕
  @override
  void didChangeMetrics() {
    Size _lastSize = window.physicalSize;
  }

  ///设备的文字大小发生变化调用
  double _lastTextScaleFactor;
  @override
  void didChangeTextScaleFactor() {
    setState(() {
      _lastTextScaleFactor = window.textScaleFactor;
    });
  }

  ///设备语言发生变化调用
  @override
  void didChangeLocales(List<Locale> locale) {
    return super.didChangeLocales(locale);
  }

  ///设备内存低时调用
  @override
  void didHaveMemoryPressure() {}

  ///辅助功能改变时调用
  @override
  void didChangeAccessibilityFeatures() {}

  ///进入页面时调用
  @override
  Future<bool> didPushRoute(String route) {
    return super.didPushRoute(route);
  }

  ///退出页面时调用
  @override
  Future<bool> didPopRoute() {
    return super.didPopRoute();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Container getContainerBody() {
    return Container(
        child: IndexedStack(
      children: <Widget>[
        HomeTab(),
        SecondTab(),
        OtherTab(),
        OtherTab(),
        OtherTab()
      ],
      index: index,
    ));
  }

  PageView getPageViewBody() {
    getPages();
    return PageView.builder(
      itemBuilder: (BuildContext context, int index) {
        return pages.elementAt(index);
      },
      controller: pageController,
      itemCount: 5,
      onPageChanged: setTabItemSelect,
    );
  }

  void getPages() {
    pages.clear();
    pages.add(HomeTab());
    pages.add(SecondTab());
    pages.add(OtherTab());
    pages.add(OtherTab());
    pages.add(OtherTab());
    pages.length = 5;
  }

  BottomNavigationBar getBottomBar() {
    return BottomNavigationBar(
      items: getBottomBarItems(),
      currentIndex: index,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: setPageViewItemSelect, //setTabItemSelect
    );
  }

  CupertinoTabBar getCupertinoTabBar() {
    return CupertinoTabBar(
      items: getBottomBarItems(),
      currentIndex: index,
      activeColor: Colors.blue,
      inactiveColor: Colors.grey,
      onTap: setPageViewItemSelect,
    );
  }

  void setTabItemSelect(int indexSelect) {
    setState(() {
      print(indexSelect);
      index = indexSelect;
    });
  }

/**
 * 底部点击切换
 */
  void setPageViewItemSelect(int indexSelect) {
    pageController.animateToPage(indexSelect,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  List<BottomNavigationBarItem> getBottomBarItems() {
    BottomNavigationBarItem item1 = BottomNavigationBarItem(
        icon: Icon(
          Icons.school,
          size: size,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.school,
          size: size,
          color: Colors.blue,
        ),
        backgroundColor: Colors.orange,
        title: Text("首页"));
    BottomNavigationBarItem item2 = BottomNavigationBarItem(
        icon: Icon(
          Icons.school,
          size: size,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.school,
          size: size,
          color: Colors.blue,
        ),
        backgroundColor: Colors.orange,
        title: Text("分类"));
    BottomNavigationBarItem item3 = BottomNavigationBarItem(
        icon: Icon(
          Icons.school,
          size: size,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.school,
          size: size,
          color: Colors.blue,
        ),
        backgroundColor: Colors.orange,
        title: Text("其他"));
    BottomNavigationBarItem item4 = BottomNavigationBarItem(
        icon: Icon(
          Icons.school,
          size: size,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.school,
          size: size,
          color: Colors.blue,
        ),
        backgroundColor: Colors.orange,
        title: Text("其他"));
    BottomNavigationBarItem item5 = BottomNavigationBarItem(
        icon: Icon(
          Icons.school,
          size: size,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          Icons.school,
          size: size,
          color: Colors.blue,
        ),
        backgroundColor: Colors.orange,
        title: Text("其他3"));
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    items.add(item5);
    items.length = 5;
    return items;
  }

  void showToast(String string) {
    Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
