import 'package:flutter/material.dart';
import 'package:flutter_app/aboutwe.dart';
import 'package:flutter_app/home/home.dart';
import 'package:flutter_app/knowledge/knowledge.dart';
import 'package:flutter_app/navigation/navigation.dart';
import 'package:flutter_app/project/project.dart';
import 'package:flutter_app/search/search.dart';
import 'package:flutter_app/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
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
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
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
          labelPadding: EdgeInsets.zero,
          tabs: <Widget>[
            Tab(
                text: "首页",
                icon: Image(
                  image: AssetImage(home
                      ? "assets/images/icon_home_pager_selected.png"
                      : "assets/images/icon_home_pager_not_selected.png"),
                  width: 28,
                  height: 28,
                )),
            Tab(
              text: "知识体系",
              icon: Image(
                image: AssetImage(knowledge
                    ? "assets/images/icon_knowledge_hierarchy_selected.png"
                    : "assets/images/icon_knowledge_hierarchy_not_selected.png"),
                width: 28,
                height: 28,
              ),
            ),
            Tab(
              text: "导航",
              icon: Image(
                image: AssetImage(navigation
                    ? "assets/images/icon_navigation_selected.png"
                    : "assets/images/icon_navigation_not_selected.png"),
                width: 28,
                height: 28,
              ),
            ),
            Tab(
              text: "项目",
              icon: Image(
                image: AssetImage(project
                    ? "assets/images/icon_project_selected.png"
                    : "assets/images/icon_project_not_selected.png"),
                width: 28,
                height: 28,
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
          break;
        case 1:
          knowledge = true;
          break;
        case 2:
          navigation = true;
          break;
        case 3:
          project = true;
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

class LeftDrawer extends StatelessWidget {
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
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  onTap: () {
                    Navigator.pop(context);
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
