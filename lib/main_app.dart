import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/aboutwe.dart';
import 'package:flutter_app/home/home.dart';
import 'package:flutter_app/knowledge/knowledge.dart';
import 'package:flutter_app/login/login_info_entity.dart';
import 'package:flutter_app/navigation/navigation.dart';
import 'package:flutter_app/project/project.dart';
import 'package:flutter_app/search/search.dart';
import 'package:flutter_app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'collect/collect.dart';
import 'login/login.dart';

//void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetSate createState() => _MyWidgetSate();
}

class _MyWidgetSate extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  TabController controller;

  bool home = true;
  bool knowledge = false;
  bool navigation = false;
  bool project = false;

  String title;
  ///
  /// tab改变监听
  ///
  _onTabChanged() {
    if (controller.index.toDouble() == controller.animation.value) {
      print("并更新数据 ${controller.index}");
      //赋值 并更新数据
      setState(() {
        home = false;
        knowledge = false;
        navigation = false;
        project = false;
        switch (controller.index) {
          case 0:
            home = true;
            title = "首页";
            break;
          case 1:
            knowledge = true;
            title = "知识体系";
            break;
          case 2:
            navigation = true;
            title = "导航";
            break;
          case 3:
            project = true;
            title = "项目";
            break;
        }
      });
    }
  }
  @override
  void initState() {
    title = "首页";
    controller = TabController(length: 4, vsync: this);
    controller.addListener(()=>_onTabChanged());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("open drawer");
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("search");
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return SearchWidget();
              }));
            },
          )
        ],
      ),
      drawer: LeftDrawer(),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          HomeWidget(),
          KnowledgeWidget(),
          NavigationWidget(),
          ProjectWidget()
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicatorWeight: 2,
          indicatorColor: ColorsUtil.hexColor(0xF39C12),
          controller: controller,
          labelColor: ColorsUtil.hexColor(0xF39C12),
          //#F39C12
          unselectedLabelColor: ColorsUtil.hexColor(0xCCCCCC),
          //#CCCCCC
          onTap: onTabTapped,
          indicatorPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          tabs: <Widget>[
            Tab(
                text: "首页",
                icon: Image(
                  image: AssetImage(home
                      ? "assets/images/icon_home_pager_selected.png"
                      : "assets/images/icon_home_pager_not_selected.png"),
                  width: 24,
                  height: 24,
                )),
            Tab(
              text: "知识体系",
              icon: Image(
                image: AssetImage(knowledge
                    ? "assets/images/icon_knowledge_hierarchy_selected.png"
                    : "assets/images/icon_knowledge_hierarchy_not_selected.png"),
                width: 24,
                height: 24,
              ),
            ),
            Tab(
              text: "导航",
              icon: Image(
                image: AssetImage(navigation
                    ? "assets/images/icon_navigation_selected.png"
                    : "assets/images/icon_navigation_not_selected.png"),
                width: 24,
                height: 24,
              ),
            ),
            Tab(
              text: "项目",
              icon: Image(
                image: AssetImage(project
                    ? "assets/images/icon_project_selected.png"
                    : "assets/images/icon_project_not_selected.png"),
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    print("当前点击的是：$index");
    setState(() {
      home = false;
      knowledge = false;
      navigation = false;
      project = false;
      switch (index) {
        case 0:
          home = true;
          title = "首页";
          break;
        case 1:
          knowledge = true;
          title = "知识体系";
          break;
        case 2:
          navigation = true;
          title = "导航";
          break;
        case 3:
          project = true;
          title = "项目";
          break;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class BottomButtonWidget extends StatefulWidget {
  String path;

  BottomButtonWidget({Key key, @required String path}) : super(key: key);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      child: Image(
        image: AssetImage(widget.path),
      ),
    );
  }
}

Future<String> login() async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  var cookies = cookieJar.loadForRequest(Uri.parse("https://www.wanandroid.com/user/login"));
  print("cookie：$cookies");
  print("cookie：${cookies.toString().contains("loginUserName")}");
  if(cookies.toString().contains("loginUserName")){
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var logininfo = prefs.getString("login");
    print("logininfo：$logininfo");
    if (logininfo.isNotEmpty) {
      print("登录信息：$logininfo");
      var info = LoginInfoData.fromJson(jsonDecode(logininfo));
      return info.username;
    }
  }
  return null;
}

class LeftDrawer extends StatefulWidget {
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                  width: 96,
                  height: 96,
                ),
                GestureDetector(
                  child: FutureBuilder<String>(
                    future: login(),
                    builder: (_, snapshot) {
                      return snapshot.hasData
                          ? Text(
                              "${snapshot.data ?? "登录"}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            )
                          : Text(
                              "${snapshot.data ?? "登录"}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            );
                    },
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return Login();
                    }));
                  },
                )
              ],
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
            title: Text("我的收藏"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return CollectWidget();
              }));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue,
            ),
            title: Text("关于我们"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return AboutWeWidget();
              }));
            },
          ),
        ],
      ),
    );
  }
}
