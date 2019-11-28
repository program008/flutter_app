import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';

import 'common_sites_entity.dart';
import 'hot_search_entity.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetSate createState() => _SearchWidgetSate();
}

class _SearchWidgetSate extends State<SearchWidget> {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            child: Text(
              "热搜",
              style: TextStyle(color: Colors.redAccent),
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: FutureBuilder<List<HotSearchData>>(
              future: loadHotKey(),
              builder: (_, snapshot) {
                return snapshot.hasData
                    ? Wrap(
                        spacing: 10.0, //两个widget之间横向的间隔
                        direction: Axis.horizontal, //方向
                        alignment: WrapAlignment.start, //内容排序方式
                        children: List<Widget>.generate(
                          snapshot.data.length,
                          (int index) {
                            var _color = Color.fromRGBO(
                              random.nextInt(256),
                              random.nextInt(256),
                              random.nextInt(256),
                              1,
                            );
                            return ActionChip(
                              //标签文字
                              label: Text(
                                snapshot.data[index].name,
                                style: TextStyle(fontSize: 16, color: _color),
                              ),
                              //点击事件
                              onPressed: () {
                                var link = snapshot.data[index].link;
                                print("open url：$link");
                                if (link.isEmpty) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("温馨提示"),
                                          content: Text("链接为空"),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16.0))),
                                          //设置圆角,
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("确定"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                  return;
                                }
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return Browser(
                                    url: link,
                                    title: snapshot.data[index].name,
                                  );
                                }));
                              },
                              elevation: 3,
                              backgroundColor: Colors.grey.shade200,
                            );
                          },
                        ).toList(),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          Padding(
            child: Text(
              "常用网站",
              style: TextStyle(color: Colors.green),
            ),
            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: FutureBuilder<List<CommonSitesData>>(
              future: loadCommonSites(),
              builder: (_, snapshot) {
                return snapshot.hasData
                    ? Wrap(
                        spacing: 10.0, //两个widget之间横向的间隔
                        direction: Axis.horizontal, //方向
                        alignment: WrapAlignment.start, //内容排序方式
                        children: List<Widget>.generate(
                          snapshot.data.length,
                          (int index) {
                            var _color = Color.fromRGBO(
                              random.nextInt(256),
                              random.nextInt(256),
                              random.nextInt(256),
                              1,
                            );
                            return ActionChip(
                              //标签文字
                              label: Text(
                                snapshot.data[index].name,
                                style: TextStyle(fontSize: 16, color: _color),
                              ),
                              //点击事件
                              onPressed: () {
                                var link = snapshot.data[index].link;
                                print("open url：$link");
                                if (link.isEmpty) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("温馨提示"),
                                          content: Text("链接为空"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("确定"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                  return;
                                }
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return Browser(
                                    url: link,
                                    title: snapshot.data[index].name,
                                  );
                                }));
                              },
                              elevation: 3,
                              backgroundColor: Colors.grey.shade200,
                            );
                          },
                        ).toList(),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<HotSearchData>> loadHotKey() async {
  Dio dio = Dio();
  Response<String> response =
      await dio.get("https://www.wanandroid.com/hotkey/json");
  var hotSearchEntity =
      EntityFactory.generateOBJ<HotSearchEntity>(jsonDecode(response.data));
  if (hotSearchEntity.errorCode == 0) {
    return hotSearchEntity.data;
  }
  return null;
}

Future<List<CommonSitesData>> loadCommonSites() async {
  Dio dio = Dio();
  Response<String> response =
      await dio.get("https://www.wanandroid.com/friend/json");
  var hotSearchEntity =
      EntityFactory.generateOBJ<CommonSitesEntity>(jsonDecode(response.data));
  if (hotSearchEntity.errorCode == 0) {
    return hotSearchEntity.data;
  }
  return null;
}
