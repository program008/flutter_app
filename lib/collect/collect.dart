import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../entity_factory.dart';
import 'collect_entity.dart';

class CollectWidget extends StatefulWidget {
  @override
  _CollectWidgetState createState() => _CollectWidgetState();
}

class _CollectWidgetState extends State<CollectWidget> {
  var textStyle1 = TextStyle(fontSize: 16, color: Colors.black);
  var textStyle2 = TextStyle(fontSize: 12, color: YColors.color_666);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
      ),
      body: FutureBuilder<List<CollectDataData>>(
        future: collectList(0, context),
        builder: (_, snapshot) {
          List<CollectDataData> articles = snapshot.data;
          return snapshot.hasData
              ? Container(
                  padding: EdgeInsets.zero,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return Browser(
                                url: articles[index].link,
                                title: articles[index].title,
                              );
                            }));
                          },
                          child: Card(
                            child: ListTile(
                              title: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                              "assets/images/icon_author.png"),
                                          width: 32,
                                          height: 32,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "${articles[index].title}",
                                              style: textStyle1,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "${articles[index].author.isNotEmpty ? "作者：${articles[index].author} " : ""}",
                                            style: textStyle2,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "分类：${articles[index].chapterName}",
                                            style: textStyle2,
                                          ),
                                        ),
                                        Text(
                                          "时间：${articles[index].niceDate}",
                                          style: textStyle2,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ))
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

/// 获取收藏文章列表
Future<List<CollectDataData>> collectList(
    int curPage, BuildContext context) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  Response<String> response =
      await dio.get("https://www.wanandroid.com/lg/collect/list/$curPage/json");
  print("获取收藏文章列表 ${response.data}");
  CollectEntity collectEntity =
      EntityFactory.generateOBJ<CollectEntity>(jsonDecode(response.data));

  if (collectEntity.errorCode == 0) {
    return collectEntity.data.datas;
  } else {
    Fluttertoast.showToast(
        msg: "${collectEntity.errorMsg}",
    );
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pop();
      Fluttertoast.cancel();
    });
  }
  return null;
}
