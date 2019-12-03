import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';
import 'package:flutter_app/widget/search_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common_sites_entity.dart';
import 'hot_search_entity.dart';
import 'search_result.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetSate createState() => _SearchWidgetSate();
}

class _SearchWidgetSate extends State<SearchWidget> {
  final random = Random();
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Future search(String k) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var word = prefs.getStringList("word");
    if(word != null){
      if(word.isNotEmpty){
        word.insert(word.length-2, k);
      }else{
        word.add(k);
        word.add("清空历史");
      }
      prefs.setStringList("word", word);
    }else{
      word = List();
      word.add(k);
      word.add("清空历史");
      prefs.setStringList("word", word);
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return SearchResult(k:_controller.text);
    }));
  }

  Future<List<String>> loadKeyWord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var word = prefs.getStringList("word");
    print("历史搜索为：$word");
    return word;
  }

  Future clearKeyWord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("word", null);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarWidget(
        focusNode: _focusNode,
        controller: _controller,
        elevation: 2.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        inputFormatters: [
          LengthLimitingTextInputFormatter(50),
        ],
        onEditingComplete: (){
          print("输入完成：");
          search(_controller.text);
        },

        searchOnTap: (){
          print("输入完成searchOnTap：${_controller.text}");
          search(_controller.text);
        },
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            child: Text(
              "搜索历史",
              style: TextStyle(color: Colors.lightBlue),
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: FutureBuilder<List<String>>(
              future: loadKeyWord(),
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
                          snapshot.data[index],
                          style: TextStyle(fontSize: 16, color: _color),
                        ),
                        //点击事件
                        onPressed: () {
                          if(index == snapshot.data.length-1){
                            clearKeyWord();
                            setState(() {
                            });
                          }else{
                            search(snapshot.data[index]);
                          }
                        },
                        elevation: 3,
                        backgroundColor: Colors.grey.shade200,
                      );
                    },
                  ).toList(),
                )
                    : Center();
              },
            ),
          ),
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
