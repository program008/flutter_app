import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../entity_factory.dart';
import '../message.dart';
import 'kd_list_entity.dart';
import 'kd_detail_entity.dart';
import 'package:cookie_jar/cookie_jar.dart';

class KnowledgeDetail extends StatefulWidget {
  KdListData kdListData;

  KnowledgeDetail({Key key, @required this.kdListData}) : super(key: key);

  @override
  _KnowledgeDetailState createState() => _KnowledgeDetailState();
}

/// 收藏文章
Future<Massage> collectArticle(int id) async {
  Dio dio = Dio();
  var cookieJar=CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  Response<String> response = await dio.post("https://www.wanandroid.com/lg/collect/$id/json");
  var result = jsonDecode(response.data);
  int errorCode = result['errorCode'];
  String errorMsg = result['errorMsg'];
  print("errorCode = $errorCode , errorMsg = $errorMsg");
  return Massage(errorCode: errorCode,errorMsg: errorMsg);
}
/// 取消收藏文章
Future<Massage> unCollectArticle(int id) async {
  Dio dio = Dio();
  var cookieJar=CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  Response<String> response = await dio.post("https://www.wanandroid.com/lg/uncollect_originId/$id/json");
  var result = jsonDecode(response.data);
  int errorCode = result['errorCode'];
  String errorMsg = result['errorMsg'];
  print("errorCode = $errorCode , errorMsg = $errorMsg");
  return Massage(errorCode: errorCode,errorMsg: errorMsg);
}
class _KnowledgeDetailState extends State<KnowledgeDetail> {
  Widget detailList(BuildContext buildContext, int cid) {
    return FutureBuilder<List<KdDetailDataData>>(
      future: kdDetailList(0, cid),
      builder: (_, snapshot) {
        List<KdDetailDataData> articles = snapshot.data;
        return snapshot.hasData
            ? DetailWidget(articles: articles, buildContext: buildContext)
            : Center();
      },
    );
  }

  Widget tabContainer(List<KdListDatachild> kdListDatachild) {
    Widget tabBarContainer = TabBar(
      isScrollable: true,
      unselectedLabelColor: YColors.color_666,
      labelColor: Theme.of(context).primaryColor,
      indicatorColor: Theme.of(context).primaryColor,
      indicatorWeight: 5.0,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      tabs: kdListDatachild.map((KdListDatachild projectTitle) {
        return Tab(
          text: projectTitle.name,
        );
      }).toList(),
      onTap: (index) {
        print("当前选中$index");
      },
    );

    Widget tabContainer = new DefaultTabController(
      length: kdListDatachild.length ?? 0,
      initialIndex: 0, //初始索引
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize + 20,
            ),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            color: YColors.color_fff,
            alignment: Alignment.center,
            child: tabBarContainer,
          ),
          Expanded(
            child: TabBarView(
              children: kdListDatachild.map((KdListDatachild projectTitle) {
                return detailList(context, projectTitle.id); //一个属于展示内容的listview
              }).toList(),
            ),
          ),
        ],
      ),
    );

    return tabContainer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.kdListData.name}"),
      ),
      body: tabContainer(widget.kdListData.children),
    );
  }
}

class DetailWidget extends StatefulWidget {
  List<KdDetailDataData> articles;
  BuildContext buildContext;

  DetailWidget({this.articles, this.buildContext});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  var textStyle1 = TextStyle(fontSize: 16, color: Colors.black);
  var textStyle2 = TextStyle(fontSize: 12, color: YColors.color_666);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: widget.articles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(widget.buildContext)
                      .push(MaterialPageRoute(builder: (_) {
                    return Browser(
                      url: widget.articles[index].link,
                      title: widget.articles[index].title,
                    );
                  }));
                },
                child: Card(
                  child: ListTile(
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: GestureDetector(
                            child: Image(
                              image: AssetImage(widget.articles[index].collect
                                  ? "assets/images/icon_like_article_selected.png"
                                  : "assets/images/icon_like_article_not_selected.png"),
                              width: 24,
                              height: 24,
                            ),
                            onTap: () {
                              print('收藏${widget.articles[index].collect}');
                              if (widget.articles[index].collect) {
                                unCollectArticle(widget.articles[index].id).then((msg){
                                  if(msg.errorCode == 0){
                                    setState(() {
                                      widget.articles[index].collect = false;
                                    });
                                  }else{
                                    Fluttertoast.showToast(msg: msg.errorMsg);
                                  }
                                });
                                //取消收藏
                              } else {
                                //收藏
                                collectArticle(widget.articles[index].id).then((msg){
                                  if(msg.errorCode == 0){
                                    setState(() {
                                      widget.articles[index].collect = true;
                                    });
                                  }else{
                                    Fluttertoast.showToast(msg: msg.errorMsg);
                                  }
                                });

                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
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
                                          "${widget.articles[index].title}",
                                          style: textStyle1,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "${widget.articles[index].author.isNotEmpty ? "作者：${widget.articles[index].author}" : ""}",
                                        style: textStyle2,
                                      ),
                                    ),
//                                          Expanded(
//                                            child: Text(
//                                              "分类：${articles[index].chapterName}",
//                                              style: textStyle2,
//                                            ),
//                                          ),
                                    Text(
                                      "时间：${widget.articles[index].niceShareDate}",
                                      style: textStyle2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

/// 获取知识体系列表
Future<List<KdDetailDataData>> kdDetailList(int curPage, int cid) async {
  Dio dio = Dio();
  var cookieJar = CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));
  Response<String> response = await dio.get(
      "https://www.wanandroid.com/article/list/$curPage/json",
      queryParameters: {"cid": cid});

  KdDetailEntity kdDetailEntity =
      EntityFactory.generateOBJ<KdDetailEntity>(jsonDecode(response.data));

  if (kdDetailEntity.errorCode == 0) {
    return kdDetailEntity.data.datas;
  }
  return null;
}
