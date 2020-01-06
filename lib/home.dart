import 'package:flutter/material.dart';
import 'package:flutter_app/fair/fairpage.dart';
import 'package:flutter_app/group/grouppage.dart';
import 'package:flutter_app/home/homepage.dart';
import 'package:flutter_app/me/mepage.dart';
import 'package:flutter_app/oldcobbers/oldcobberspage.dart';

/// 启动页，显示版本号，显示广告页，
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: BottomMenuPage(),
    );
  }
}

/// 有状态StatefulWidget
/// 继承于 StatefulWidget，通过 State 的 build 方法去构建控件
class BottomMenuPage extends StatefulWidget {
  ////通过构造方法传值
  BottomMenuPage();

  //主要是负责创建state
  @override
  BottomMenuPageState createState() => BottomMenuPageState();
}

/// 在 State 中,可以动态改变数据
/// 在 setState 之后，改变的数据会触发 Widget 重新构建刷新
class BottomMenuPageState extends State<BottomMenuPage> {
  BottomMenuPageState();

  //当前显示页面的
  int currentIndex = 0;

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //构建页面
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavTab,
        currentIndex: currentIndex,
        //所以一般都是使用fixed模式，此时，导航栏的图标和标题颜色会使用fixedColor指定的颜色，
        // 如果没有指定fixedColor，则使用默认的主题色primaryColor
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xFFB2B2B2),
        selectedItemColor: Color(0xFF42BD56),
        //底部菜单点击回调
        onTap: (index) {
          _changePage(index);
        },
      ),
      //对应的页面
      body: pages[currentIndex],
    );
  }

  //点击导航项是要显示的页面
  final pages = [
    HomePage("首页"),
    OldcobbersPage("书影音"),
    GroupPage("小组"),
    FairPage("市集"),
    MePage("我的")
  ];
  final bottomNavTab = [
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/ic_tab_home_normal.png",
        width: 32,
        height: 32,
      ),
      activeIcon: Image.asset(
        "assets/images/ic_tab_home_active.png",
        width: 32,
        height: 32,
      ),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/ic_tab_subject_normal.png",
        width: 32,
        height: 32,
      ),
      activeIcon: Image.asset(
        "assets/images/ic_tab_subject_active.png",
        width: 32,
        height: 32,
      ),
      title: Text("书影音"),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/ic_tab_group_normal.png",
        width: 32,
        height: 32,
      ),
      activeIcon: Image.asset(
        "assets/images/ic_tab_group_active.png",
        width: 32,
        height: 32,
      ),
      title: Text("小组"),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/images/ic_tab_shiji_normal.png",
        width: 32,
        height: 32,
      ),
      activeIcon: Image.asset(
        "assets/images/ic_tab_shiji_active.png",
        width: 32,
        height: 32,
      ),
      title: Text("市集"),
    ),
    BottomNavigationBarItem(
        icon: Image.asset(
          "assets/images/ic_tab_profile_normal.png",
          width: 32,
          height: 32,
        ),
        title: Text("我的"),
        activeIcon: Image.asset(
          "assets/images/ic_tab_profile_active.png",
          width: 32,
          height: 32,
        )),
  ];

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
