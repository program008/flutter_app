import 'package:flutter/material.dart';
import 'package:flutter_app/oldcobbers/bookpage.dart';
import 'package:flutter_app/oldcobbers/fictionpage.dart';
import 'package:flutter_app/oldcobbers/localpage.dart';
import 'package:flutter_app/oldcobbers/moviepage.dart';
import 'package:flutter_app/oldcobbers/musicpage.dart';
import 'package:flutter_app/oldcobbers/tvpage.dart';

/// 书影音
class OldcobbersPage extends StatefulWidget {
  String _title;

  OldcobbersPage(this._title);

  @override
  _OldcobbersPageState createState() => _OldcobbersPageState();
}

class _OldcobbersPageState extends State<OldcobbersPage> {
  var titles = ["电影", "电视", "读书", "原创小说", "音乐", "同城"];

  Widget tabContainer(List<String> projectTitles) {
    Widget tabBarContainer = TabBar(
      isScrollable: true,
      unselectedLabelColor: Color(0xff909090),
      labelColor: Color(0xff4c4c4c),
      indicatorColor: Color(0xff4c4c4c),
      indicatorWeight: 2.0,
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      tabs: projectTitles.map((String projectTitle) {
        return Tab(
          text: projectTitle,
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
            alignment: Alignment.center,
            child: tabBarContainer,
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                MoviePage("电影"),
                TvPage("电视"),
                BookPage("读书"),
                FictionPage("原创小说"),
                MusicPage("音乐"),
                LocalPage("同城")
              ],
            ),
          ),
        ],
      ),
    );

    return tabContainer;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFEBEBEB)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.asset(
                          "assets/images/ic_search.png",
                          width: 36,
                          height: 36,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "这里有一张回到2000年的车票",
                          style: TextStyle(color: Color(0xFFC2C2C2)),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Image.asset(
                            "assets/images/ic_scan.png",
                            width: 36,
                            height: 36,
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Image.asset(
                  "assets/images/ic_mail.png",
                  width: 36,
                  height: 36,
                ),
              )
            ],
          ),
          Expanded(
            child: tabContainer(titles),
          )
        ],
      ),
    );
  }
}
