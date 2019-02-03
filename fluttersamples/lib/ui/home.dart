import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersamples/ui/hometab.dart';
import 'package:fluttersamples/ui/othertab.dart';
import 'package:fluttersamples/ui/secondtab.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int index = 0;
  double size = 25.0;
  List<BottomNavigationBarItem> items = new List();
  List<Widget> pages = new List();
  var pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    return Scaffold(
      body: getPageViewBody(),
      bottomNavigationBar: getCupertinoTabBar(),
    );
  }

  @override
  void dispose() {
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
}
