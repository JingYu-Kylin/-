import 'package:flutter/material.dart';
import 'package:xiaoliuren/CalendarView.dart';
import 'package:xiaoliuren/ChildItemView.dart';
import 'package:xiaoliuren/ExplanationView.dart';
import 'package:xiaoliuren/XiaoLiuRen.dart';

/**
 * 有状态StatefulWidget
 *  继承于 StatefulWidget，通过 State 的 build 方法去构建控件
 */
class BotomeMenumPage extends StatefulWidget {
  ////通过构造方法传值
  BotomeMenumPage();

  //主要是负责创建state
  @override
  BotomeMenumPageState createState() => BotomeMenumPageState();
}

/**
 * 在 State 中,可以动态改变数据
 * 在 setState 之后，改变的数据会触发 Widget 重新构建刷新
 */
class BotomeMenumPageState extends State<BotomeMenumPage> {
  BotomeMenumPageState();
  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //图片加载在缓存中 (解决图片初次加载过慢的问题)
    precacheImage(AssetImage("assets/images/top.png"), context);
    //构建页面
    return buildBottomTabScaffold();
  }

  //当前显示页面的
  int currentIndex = 0;
  //底部导航栏显示的内容
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.brown,
      icon: Icon(IconData(0xe518,fontFamily: 'MyIcons')),
//      activeIcon: Icon(IconData(0xe660,fontFamily: 'MyIcons')),
      title: Text("日历"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.brown,
      icon: Icon(IconData(0xe677,fontFamily: 'MyIcons')),
      title: Text("小六壬"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.brown,
      icon: Icon(IconData(0xe612,fontFamily: 'MyIcons')),
      title: Text("详解"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.brown,
      icon: Icon(IconData(0xe609,fontFamily: 'MyIcons')),
      title: Text("我的"),
    ),
  ];

  //点击导航项是要显示的页面
  final pages = [
    CalendarView("日历"),
    XiaoLiuRenView("小六壬"),
    ExplanationView("详解"),
    ChildItemView("我的")
  ];

  Widget buildBottomTabScaffold() {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        //所以一般都是使用fixed模式，此时，导航栏的图标和标题颜色会使用fixedColor指定的颜色，
        // 如果没有指定fixedColor，则使用默认的主题色primaryColor
        type: BottomNavigationBarType.fixed,
        //底部菜单点击回调
        onTap: (index) {
          _changePage(index);
        },
      ),
      //对应的页面
      body: pages[currentIndex],
    );
  }
  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}