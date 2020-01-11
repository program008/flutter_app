import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/API.dart';
import 'package:flutter_app/view/star_rating.dart';

import 'bean/top250_entity.dart';
import 'bean/weekly_entity.dart';

class MoviePage extends StatefulWidget {
  String _title;

  MoviePage(this._title);

  @override
  _MoviePageSate createState() => _MoviePageSate();
}

class _MoviePageSate extends State<MoviePage> {
  List<String> todayUrls = [];
  List<Top250Subject> hots = [];
  List<Top250Subject> doubanhots = [];
  int total = 0;
  int total2 = 0;
  List<Top250Subject> comingSoons = [];
  var text_white10 = TextStyle(color: Colors.white, fontSize: 12);
  var text_white12 = TextStyle(color: Colors.white, fontSize: 10);
  var text_gray14 = TextStyle(color: Color(0xff909090), fontSize: 14);
  var text_black14 = TextStyle(color: Colors.black, fontSize: 14);
  var text_black16 =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
  var text_gray16 = TextStyle(
      color: Color(0xff909090), fontSize: 16, fontWeight: FontWeight.w400);
  var movieTitles = ["影院热映", "即将上映"];
  var hot = true;
  Top250Entity top250entity;
  WeeklyEntity weeklyEntity;

  Widget topbtn(String image, String title) {
    return Column(
      children: <Widget>[
        Image.asset(image, width: 56, height: 56),
        Padding(
          child: Text(
            title,
            style: TextStyle(color: Color(0xff909090), fontSize: 12),
          ),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    //获取今日可播放电=电影更新
    API().getTodayPlay((images) {
      print("images：$images");
      setState(() {
        todayUrls = images;
      });
    });

    // 获取热映 和即将上映 hots,comingSoons
    API().getHotComingSoon((list) {
      setState(() {
        hots = list["hots"];
        comingSoons = list["comingSoons"];
        total = list["total"];
        total2 = list["total2"];
      });
    });

    //豆瓣热门
    API().getHot((list) {
      setState(() {
        doubanhots = list;
      });
    });

    //豆瓣榜单1
    API().top250((entity) {
      setState(() {
        top250entity = entity;
      });
    });
    //豆瓣榜单2
    API().getWeekly((entity) {
      setState(() {
        weeklyEntity = entity;
      });
    });
  }

  /// 今日可更新电影
  Widget imageTop() {
    // 270 390 AspectRatio
    if (todayUrls.isNotEmpty) {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Container(
              height: 80,
              margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: AspectRatio(
                aspectRatio: 270.0 / 390,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    todayUrls[2],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 90,
              margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: AspectRatio(
                aspectRatio: 270.0 / 390,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    todayUrls[1],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 95,
              child: AspectRatio(
                aspectRatio: 270.0 / 390,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        todayUrls[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Image.asset(
                      "assets/images/ic_action_playable_video_s.png",
                      width: 32,
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              topbtn("assets/images/find_movie.png", "找电影"),
              topbtn("assets/images/douban_top.png", "豆瓣榜单"),
              topbtn("assets/images/douban_guess.png", "豆瓣猜"),
              topbtn("assets/images/douban_film_list.png", "豆瓣片单"),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                    color: Color(0xFF717B7F),
                    borderRadius: BorderRadius.circular(5)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "今日播放电影已更新",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            "全部30 >",
                            style: text_white12,
                          ),
                        ],
                      ),
                      right: 60,
                      top: 20,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/sofa.png",
                            width: 14,
                            height: 14,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                            child: Text(
                              "看电影",
                              style: text_white10,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              imageTop()
            ],
          ),
        ),
        //影院热映 即将上映
        Container(
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize + 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 2,
                      color: hot ? Colors.black : Colors.transparent,
                    ))),
                    child: FlatButton(
                      child: Text(
                        "影院热映",
                        style: hot ? text_black16 : text_gray16,
                      ),
                      onPressed: () {
                        print("影院热映");
                        setState(() {
                          hot = true;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 2,
                      color: !hot ? Colors.black : Colors.transparent,
                    ))),
                    child: FlatButton(
                      child: Text(
                        "即将上映",
                        style: !hot ? text_black16 : text_gray16,
                      ),
                      onPressed: () {
                        print("即将上映");
                        setState(() {
                          hot = false;
                        });
                      },
                    ),
                  )
                ],
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "全部${hot ? total : total2}>",
                  style: text_black14,
                ),
              ),
            ],
          ),
        ),
        //显示热播 or 即将上映
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: hot ? TheatersHot(hots) : ComingSoon(comingSoons),
        ),
        //豆瓣热门 title
        Container(
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize + 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "豆瓣热门",
                      style: text_black16,
                    ),
                  ),
                ],
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "全部250>",
                  style: text_black14,
                ),
              ),
            ],
          ),
        ),
        // 豆瓣热门content
        Container(
          child: TheatersHot(doubanhots),
        ),
        //豆瓣榜单
        Container(
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize + 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      "豆瓣榜单",
                      style: text_black16,
                    ),
                  ),
                ],
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "全部10>",
                  style: text_black14,
                ),
              ),
            ],
          ),
        ),
        //豆瓣榜单的内容
        DoubanList(top250entity, weeklyEntity)
      ],
    );
  }
}

class TheatersHot extends StatelessWidget {
  List<Top250Subject> _subjects;

  TheatersHot(this._subjects);

  /// 电影的内容简介
  Widget movieShow(Top250Subject subject) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                height: 140,
                child: AspectRatio(
                  aspectRatio: 270.0 / 378,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      subject.images.medium,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Image.asset(
                "assets/images/ic_subject_rating_mark_wish.png",
                width: 30,
                height: 30,
              )
            ],
          ),
          Padding(
            child: Text(
              "${subject.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          StarRating(subject.rating.average)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: _subjects.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          if (_subjects.isNotEmpty) {
            return movieShow(_subjects[index]);
          } else {
            return Container();
          }
        });
  }
}

class ComingSoon extends StatelessWidget {
  List<Top250Subject> _subjects;

  ComingSoon(this._subjects);

  /// 电影的内容简介
  Widget movieShow(Top250Subject subject) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                height: 140,
                child: AspectRatio(
                  aspectRatio: 270.0 / 378,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      subject.images.medium,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Image.asset(
                "assets/images/ic_subject_rating_mark_wish.png",
                width: 30,
                height: 30,
              )
            ],
          ),
          Padding(
            child: Text(
              "${subject.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            padding: EdgeInsets.symmetric(vertical: 2),
          ),
          Text(
            "${subject.collectCount}人想看",
            style: TextStyle(color: Color(0xff909090), fontSize: 10),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            padding: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(3)),
            child: Text("${updateTime(subject.mainlandPubdate)}",
                style: TextStyle(color: Colors.red, fontSize: 8)),
          )
        ],
      ),
    );
  }

  //上映时间格式化
  String updateTime(String time) {
    var list = time.split("-");
    if (list.length == 3) {
      return "${list[1]}月${list[2]}日";
    }
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: _subjects.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            if (_subjects.isNotEmpty) {
              return movieShow(_subjects[index]);
            } else {
              return Container();
            }
          }),
    );
  }
}

/// 豆瓣榜单
class DoubanList extends StatelessWidget {
  Top250Entity _top250entity;
  WeeklyEntity _weeklyEntity;

  DoubanList(this._top250entity, this._weeklyEntity);

  Widget deltaWidget(int delta) {
    if (delta > 0) {
      return Image.asset(
        "assets/images/ic_rank_up_xs.png",
        width: 15,
        height: 15,
        color: Colors.white,
      );
    } else if (delta == 0) {
      return Image.asset(
        "assets/images/ic_rank_null_xs.png",
        width: 15,
        height: 15,
        color: Colors.white,
      );
    } else {
      return Image.asset(
        "assets/images/ic_rank_down_xs.png",
        width: 15,
        height: 15,
        color: Colors.white,
      );
    }
  }

  Widget rankTop250(int rank, String title, double average, {int delta = 0}) {
    var text12 = TextStyle(color: Colors.white, fontSize: 12);
    var text14 = TextStyle(color: Color(0xFFD28236), fontSize: 14);
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
      child: Row(
        children: <Widget>[
          Text(
            "$rank.",
            style: text12,
          ),
          Text(
            "$title",
            style: text12,
          ),
          Expanded(
            child: Padding(
              child: Text(
                "$average",
                style: text14,
              ),
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            ),
          ),
          Padding(
            child: deltaWidget(delta),
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          )
        ],
      ),
    );
  }

  Widget getTop250(Top250Entity top250entity) {
    if (top250entity != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              width: 240,
              child: AspectRatio(
                aspectRatio: 270.0 / 378,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    top250entity.subjects[0].images.medium,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 140,
              width: 240,
              decoration: BoxDecoration(
                  color: Color(0xFF4C4B3D),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  rankTop250(1, top250entity.subjects[0].title,
                      top250entity.subjects[0].rating.average),
                  rankTop250(2, top250entity.subjects[1].title,
                      top250entity.subjects[1].rating.average),
                  rankTop250(3, top250entity.subjects[2].title,
                      top250entity.subjects[2].rating.average),
                  rankTop250(4, top250entity.subjects[3].title,
                      top250entity.subjects[3].rating.average),
                ],
              ),
            ),
            Positioned(
              top: 100,
              child: Text(
                "${top250entity.title}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: Text(
                "豆瓣榜单•共${top250entity.total}部",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          ],
        ),
      );
    }
    return Container();
  }

  Widget getWeekly(WeeklyEntity weeklyEntity,{int index = 1}) {
    if (weeklyEntity != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              width: 240,
              child: AspectRatio(
                aspectRatio: 270.0 / 378,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    weeklyEntity.subjects[index].subject.images.medium,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Container(
              width: 240,
              height: 140,
              decoration: BoxDecoration(
                  color: Color(0xFF4C2C2E),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  rankTop250(1, weeklyEntity.subjects[index-1+0].subject.title,
                      weeklyEntity.subjects[index-1+0].subject.rating.average,
                      delta: weeklyEntity.subjects[index-1+0].delta),
                  rankTop250(2, weeklyEntity.subjects[index-1+1].subject.title,
                      weeklyEntity.subjects[index-1+1].subject.rating.average,
                      delta: weeklyEntity.subjects[index-1+1].delta),
                  rankTop250(3, weeklyEntity.subjects[index-1+2].subject.title,
                      weeklyEntity.subjects[index-1+2].subject.rating.average,
                      delta: weeklyEntity.subjects[index-1+2].delta),
                  rankTop250(4, weeklyEntity.subjects[index-1+3].subject.title,
                      weeklyEntity.subjects[index-1+3].subject.rating.average,
                      delta: weeklyEntity.subjects[index-1+3].delta),
                ],
              ),
            ),
            Positioned(
              top: 100,
              child: Text(
                "${weeklyEntity.title}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: Text(
                "每周五更新•共${weeklyEntity.subjects.length}部",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          ],
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[getWeekly(_weeklyEntity), getTop250(_top250entity),getWeekly(_weeklyEntity,index: 5)],
      ),
    );
  }
}
