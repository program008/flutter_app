import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';
import '../entity_factory.dart';
import 'navigation_list_entity.dart';

class NavigationWidget extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: NaviPage(
            buildContext: context,
          ),
        ),
      ),
    );
  }
}

class NaviPage extends StatefulWidget {
  BuildContext buildContext;

  NaviPage({this.buildContext});

  @override
  State<StatefulWidget> createState() {
    return _NaviPageState();
  }
}

class _NaviPageState extends State<NaviPage> {
  List<NavigationListData> _datas = List(); //一级分类集合
  List<NavigationListDataArticle> articles = List(); //二级分类集合
  int index; //一级分类下标

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      Dio dio = Dio();
      Response<String> response =
          await dio.get("https://www.wanandroid.com/navi/json");
      var kdListEntity = EntityFactory.generateOBJ<NavigationListEntity>(
          jsonDecode(response.data));

      /// 初始化
      setState(() {
        _datas = kdListEntity.data;
        index = 0;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _datas.length != 0
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: YColors.color_fff,
                  child: ListView.builder(
                    itemCount: _datas.length,
                    itemBuilder: (BuildContext context, int position) {
                      return getRow(position);
                    },
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        //height: double.infinity,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        color: YColors.color_F9F9F9,
                        child: getChip(
                            buildContext: widget.buildContext,
                            i: index), //传入一级分类下标
                      ),
                    ],
                  )),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }

  Widget getRow(int i) {
    Color textColor = Theme.of(context).primaryColor; //字体颜色
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //Container下的color属性会与decoration下的border属性冲突，所以要用decoration下的color属性
        decoration: BoxDecoration(
          color: index == i ? YColors.color_F9F9F9 : Colors.white,
          border: Border(
            left: BorderSide(
                width: 5,
                color:
                    index == i ? Theme.of(context).primaryColor : Colors.white),
          ),
        ),
        child: Text(
          _datas[i].name,
          style: TextStyle(
            color: index == i ? textColor : YColors.color_666,
            fontWeight: index == i ? FontWeight.w600 : FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
          textColor = YColors.colorPrimary;
        });
      },
    );
  }

  Widget getChip({BuildContext buildContext, int i}) {
    //更新对应下标数据
    _updateArticles(i);
    return Wrap(
      spacing: 10.0, //两个widget之间横向的间隔
      direction: Axis.horizontal, //方向
      alignment: WrapAlignment.start, //内容排序方式
      children: List<Widget>.generate(
        articles.length,
        (int index) {
          return ActionChip(
            //标签文字
            label: Text(
              articles[index].title,
              style: TextStyle(fontSize: 16, color: YColors.color_666),
            ),
            //点击事件
            onPressed: () {
              Navigator.of(buildContext).push(
                MaterialPageRoute(
                  builder: (context) => Browser(
                      title: articles[index].title, url: articles[index].link),
                ),
              );
            },
            elevation: 3,
            backgroundColor: Colors.grey.shade200,
          );
        },
      ).toList(),
    );
  }

  ///
  /// 根据一级分类下标更新二级分类集合
  ///
  List<NavigationListDataArticle> _updateArticles(int i) {
    setState(() {
      if (_datas.length != 0) articles = _datas[i].articles;
    });
    return articles;
  }
}
