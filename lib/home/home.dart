import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import '../entity_factory.dart';
import 'adpicture.dart';
import 'article_list_entity.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  List<BannerData> bannerList = [];

  @override
  void initState() {
    loadAdPictures().then((List<BannerData> banner) {
      setState(() {
        bannerList = banner;
      });
    });

    loadArticles(0).then((List<ArticleListDataData> articles) {
      print(articles);
    });
  }

  @override
  Widget build(BuildContext context) {
    var bannerWidget = BannerSwiper(
      //width  和 height 是图片的高宽比  不用传具体的高宽   必传
      height: 5,
      width: 9,
      //轮播图数目 必传
      length: bannerList.length,
      spaceMode: false,
      showIndicator: false,
      //轮播的item  widget 必传
      getwidget: (index) {
        return new GestureDetector(
            child: Stack(
              children: <Widget>[
                Image.network(
                  bannerList[index % bannerList.length].imagePath,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 900,
                  margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          bannerList[index % bannerList.length].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text("${index % bannerList.length}/${bannerList.length}",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              print("当前点击的是：$index");
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: bannerList[index % bannerList.length].url,
                  title: bannerList[index % bannerList.length].title,
                );
              }));
            });
      },
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Container(width: 450, height: 250, child: bannerWidget),
          FutureBuilder<List<ArticleListDataData>>(
            future: loadArticles(0),
            builder: (_, snapshot) {
              return snapshot.hasData
                  ? ArticleItem(buildContext: context, articles: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          )
        ])));
  }
}

///
/// 加载首页轮播图的图片数据
Future<List<BannerData>> loadAdPictures() async {
  Dio dio = Dio();
  Response<String> response =
      await dio.get("https://www.wanandroid.com/banner/json");
  var banner = BannerEntity.fromJson(jsonDecode(response.data));
  return banner.data;
}

///
/// 加载文章列表数据
Future<List<ArticleListDataData>> loadArticles(int pageSize) async {
  Dio dio = Dio();
  Response<String> response =
      await dio.get("https://www.wanandroid.com/article/list/$pageSize/json");
  var articleList =
      EntityFactory.generateOBJ<ArticleListEntity>(jsonDecode(response.data));
  if (articleList.errorCode == 0) {
    return articleList.data.datas;
  }
  return null;
}

class ArticleItem extends StatelessWidget {
  List<ArticleListDataData> articles;
  BuildContext buildContext;

  ArticleItem({Key key, this.buildContext, @required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle1 = TextStyle(fontSize: 16, color: Colors.black);
    var textStyle2 = TextStyle(fontSize: 12, color: YColors.color_666);
    return Container(
        padding: EdgeInsets.zero,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(buildContext)
                      .push(MaterialPageRoute(builder: (_) {
                    return Browser(
                      url: articles[index].link,
                      title: articles[index].title,
                    );
                  }));
                },
                child: Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/icon_like_article_not_selected.png"),
                            width: 24,
                            height: 24,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Text(
                                        "${articles[index].author.isNotEmpty ? "作者：${articles[index].author}" : ""}",
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
                                      "时间：${articles[index].niceShareDate}",
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
