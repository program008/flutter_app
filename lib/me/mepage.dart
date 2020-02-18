import 'package:flutter/material.dart';

/// 我的
class MePage extends StatefulWidget {
  String _title;

  MePage(this._title);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with TickerProviderStateMixin {
  ScrollController controller = new ScrollController();
  bool show = false;
  bool movie = true;
  bool book = false;
  bool music = false;
  var text_black14 =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600);
  var text_gray14 = TextStyle(
      color: Color(0xff909090), fontSize: 14, fontWeight: FontWeight.w400);

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print("滚动位移：${controller.offset}      $show");
      if (controller.offset > 140 && !show) {
        setState(() {
          show = true;
        });
      } else if (controller.offset <= 140 && show) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: controller,
        headerSliverBuilder: _sliverBuilder,
        body: Center(
          child: Container(
            decoration: BoxDecoration(color: Color(0xF2F1EE)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 2,
                          color: movie ? Colors.black : Colors.transparent,
                        ))),
                        child: GestureDetector(
                          child: Text(
                            "影视",
                            style: movie ? text_black14 : text_gray14,
                          ),
                          onTap: () {
                            setState(() {
                              movie = true;
                              book = false;
                              music = false;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 2,
                          color: book ? Colors.black : Colors.transparent,
                        ))),
                        child: GestureDetector(
                          child: Text(
                            "图书",
                            style: book ? text_black14 : text_gray14,
                          ),
                          onTap: () {
                            setState(() {
                              movie = false;
                              book = true;
                              music = false;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          width: 2,
                          color: music ? Colors.black : Colors.transparent,
                        ))),
                        child: GestureDetector(
                          child: Text(
                            "音乐",
                            style: music ? text_black14 : text_gray14,
                          ),
                          onTap: () {
                            setState(() {
                              movie = false;
                              book = false;
                              music = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // 分割线
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: Color(0xff909090)))),
                ),
                // 影视 图书 音乐 内容框
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: movie
                      ? videos() : book ? books() : music ? musics() : videos(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child:
                      itemAction("assets/images/sofa.png", 0xFF9794E6, "看电影"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: itemAction(
                      "assets/images/ic_pen_small_gray.png", 0, "我的发布"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child:
                      itemAction("assets/images/ic_me_article.png", 0, "我的日记"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child:
                      itemAction("assets/images/ic_me_follows.png", 0, "我的关注"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: itemAction(
                      "assets/images/ic_me_photo_album.png", 0, "相册"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child:
                      itemAction("assets/images/ic_me_doulist.png", 0, "豆列/收藏"),
                ),
              ],
            ),
          ),
        ));
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        //标题居中
        centerTitle: true,
        //展开高度200
        expandedHeight: 200.0,
        //不随着滑动隐藏标题
        floating: true,
        //固定在顶部
        pinned: true,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: 10,
          height: 10,
          child: IconButton(
            icon: Image.asset(
              "assets/images/ic_settings.png",
              width: 24,
              height: 24,
              color: !show ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/images/ic_mail.png",
              width: 24,
              height: 24,
              color: !show ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          )
        ],
        title: show
            ? Text(
                "我的",
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            : Text(""),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new ExactAssetImage("assets/images/bg_mine_login.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: 140,
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Text("登录/注册"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/ic_wechat_white.png",
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          "微信登录",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/ic_weibo_white.png",
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          "微博登录",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ];
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('无与伦比的标题+$index'),
    );
  }

  Widget _itemIcon(String icon, int iconColor) {
    if (iconColor == 0) {
      return Image.asset(icon, width: 27, height: 27);
    }
    return Image.asset(
      icon,
      width: 27,
      height: 27,
      color: Color(iconColor),
    );
  }

  /// 我的页面 子菜单按钮
  Widget itemAction(String icon, int iconColor, String title) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _itemIcon(icon, iconColor),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Color(0xFF323232), fontSize: 14),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Image.asset(
              "assets/images/ic_arrow_forward.png",
              width: 25,
              height: 25,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget videos() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_videos_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("想看0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_videos_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("在看0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_videos_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("看过0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
      ],
    );
  }

  Widget books() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_books_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("想读0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_books_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("在读0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_books_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("读过0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
      ],
    );
  }

  Widget musics() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_music_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("想听0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_music_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("在听0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/bg_music_stack_default_80.png",
                width: 60,
                height: 60,
              ),
              Text("听过0",
                  style: TextStyle(color: Color(0xFF323232), fontSize: 14))
            ],
          ),
        ),
      ],
    );
  }
}
