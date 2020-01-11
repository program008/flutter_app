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
          child: ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: 15,
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
        title: show?Text("我的",style: TextStyle(fontSize: 16,color: Colors.black),):Text(""),
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
}
