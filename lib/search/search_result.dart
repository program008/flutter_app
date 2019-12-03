import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'search_result_entity.dart';

class SearchResult extends StatefulWidget {
  String k;

  SearchResult({Key key, @required this.k}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  var textStyle1 = TextStyle(fontSize: 16, color: Colors.black);
  var textStyle2 = TextStyle(fontSize: 12, color: YColors.color_666);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索结果"),
      ),
      body: FutureBuilder<List<SearchResultDataData>>(
        future: search(widget.k),
        builder: (_, snapshot) {
          List<SearchResultDataData> articles = snapshot.data;
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

Future<List<SearchResultDataData>> search(String k) async {
  Dio dio = Dio();
  Response<String> response = await dio.post(
      "https://www.wanandroid.com/article/query/0/json",
      queryParameters: {"k": k});
  print("${response.data}");
  SearchResultEntity searchResultEntity =
      EntityFactory.generateOBJ<SearchResultEntity>(jsonDecode(response.data));
  if (searchResultEntity.errorCode == 0) {
    if(searchResultEntity.data.datas.isEmpty){
      Fluttertoast.showToast(msg: '没有搜索到...');
    }
    return searchResultEntity.data.datas;
  }

  return null;
}
