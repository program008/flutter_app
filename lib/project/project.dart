import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/webview/browser.dart';

import '../entity_factory.dart';
import 'project_list_entity.dart';
import 'project_title_list_entity.dart';

class ProjectWidget extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<ProjectWidget> {

  Widget tabContainer(List<ProjectTitleListData> projectTitles) {
    Widget tabBarContainer = TabBar(
      isScrollable: true,
      unselectedLabelColor: YColors.color_666,
      labelColor: Theme.of(context).primaryColor,
      indicatorColor: Theme.of(context).primaryColor,
      indicatorWeight: 5.0,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      tabs: projectTitles.map((ProjectTitleListData projectTitle) {
        return Tab(
          text: projectTitle.name,
        );
      }).toList(),
      onTap: (index) {
        print("当前选中$index");
      },
    );

    Widget tabContainer = new DefaultTabController(
      length: projectTitles.length ?? 0,
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
              children: projectTitles.map((ProjectTitleListData projectTitle) {
                return projectListWidget(projectTitle.id); //一个属于展示内容的listview
              }).toList(),
            ),
          ),
        ],
      ),
    );

    return tabContainer;
  }

  Widget projectListWidget(int cid) {
    var textStyle1 = TextStyle(fontSize: 16, color: Colors.black);
    var textStyle2 = TextStyle(fontSize: 12, color: Colors.black38);
    return FutureBuilder<List<ProjectListDataData>>(
      future: projectList(1, cid),
      builder: (_, snapshot) {
        return snapshot.hasData
            ? Container(
                color: YColors.color_F9F9F9,
                child: ListView.builder(
                    itemCount: snapshot.data.length ?? 0,
                    itemBuilder: (_, index) {
                      ProjectListDataData projectListDataData =
                          snapshot.data[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return Browser(
                              url: projectListDataData.link,
                              title: projectListDataData.title,
                            );
                          }));
                        },
                        child: Card(
                          margin: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Image.network(
                                  projectListDataData.envelopePic,
                                  width: 80,
                                  height: 100,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Image(
                                              image: AssetImage(
                                                  "assets/images/icon_author.png"),
                                              width: 32,
                                              height: 32,
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 10),
                                                child: Text(
                                                  "${projectListDataData.title}",
                                                  style: textStyle1,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Text(
                                            "${projectListDataData.desc}",
                                            style: textStyle2,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 0, 10, 10),
                                          child: Text(
                                            "${projectListDataData.niceShareDate} ${projectListDataData.author}",
                                            style: textStyle2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: FutureBuilder<List<ProjectTitleListData>>(
          future: titleList(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? tabContainer(snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

/// 获取项目顶部标题列表
Future<List<ProjectTitleListData>> titleList() async {
  Dio dio = Dio();
  Response<String> response =
      await dio.get("https://www.wanandroid.com/project/tree/json");
  ProjectTitleListEntity projectTitleListEntity =
      EntityFactory.generateOBJ<ProjectTitleListEntity>(
          jsonDecode(response.data));
  if (projectTitleListEntity.errorCode == 0) {
    return projectTitleListEntity.data;
  }
  return null;
}

/// 获取项目列表数据
Future<List<ProjectListDataData>> projectList(int curPage, int cid) async {
  Dio dio = Dio();
  Response<String> response = await dio.get(
      "https://www.wanandroid.com/project/list/$curPage/json",
      queryParameters: {"cid": cid});

  ProjectListEntity projectListEntity =
      EntityFactory.generateOBJ<ProjectListEntity>(jsonDecode(response.data));

  if (projectListEntity.errorCode == 0) {
    return projectListEntity.data.datas;
  }
  return null;
}
