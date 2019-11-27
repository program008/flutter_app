import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutWeWidget extends StatefulWidget {
  @override
  _AboutWeWidget createState() => _AboutWeWidget();
}

class _AboutWeWidget extends State<AboutWeWidget> {
  var appInfo = "";
  var aboutwe = "技术点\n\n"
      "项目代码尽力遵循了阿里巴巴Java开发规范和阿里巴巴Android开发规范，并有良好的注释。\n\n"
      "使用Rxjava2结合Retrofit2进行网络请求。\n\n"
      "使用Rxjava2的操作符对事件流进行进行转换、延时、过滤等操作，其中使用Compose操作符结合RxUtils工具类简化线程切换调用的代码数量。\n\n"
      "使用Dagger2无耦合地将Model注入Presenter、Presenter注入View，更高效地实现了MVP模式。\n\n"
      "使用BasePresenter对事件流订阅的生命周期做了集成管理。\n\n"
      "使用Material Design中的Behavior集合ToolBar实现了响应式的“上失下现”特效。\n\n"
      "多处使用了滑动到顶部的悬浮按钮，提升阅读的便利性。\n\n"
      "使用SmartRefreshLayout丰富的刷新动画将项目的美提升了一个档次。\n\n"
      "使用了腾讯Bugly，以便对项目进行Bug修复和CI。\n\n"
      "项目中多处使用了炫目的动画及特效。\n\n"
      "更多请Clone本项目进行查看。。。\n\n"
      "版本\n"
      "V1.0.0\n"
      "1.提交Awesome WanAndroid第一版\n\n"
      "感谢\n"
      "API：\n"
      "鸿洋大大提供的WanAndroid API\n\n"
      "APP：\n"
      "GeekNews提供了Dagger2配合MVP的架构思路\n\n"
      "Toutiao提供的MD特效实现思路\n\n"
      "diycode提供的智能滑动悬浮按钮实现思路\n\n"
      "Eyepetizer-in-Kotlin提供的搜索界面切换特效实现思路\n\n"
      "此外，还参考了不少国内外牛人的项目，感谢开源！\n\n"
      "界面设计：\n"
      "花瓣 提供了很美的UI界面设计，感谢花瓣\n"
      "icon：\n"
      "iconfont 阿里巴巴对外开放的很棒的icon资源\n";

  @override
  void initState() {
    // 真机测试
    try {
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        String appName = packageInfo.appName;
        String packageName = packageInfo.packageName;
        String version = packageInfo.version;
        String buildNumber = packageInfo.buildNumber;
        setState(() {
          appInfo =
              "appName: $appName\npackageName: $packageName\nversion: $version\nbuildNumber: $buildNumber";
        });
      });
    } catch (e) {
      setState(() {
        appInfo = "需要使用真机测试";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('关于我们'),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                        "assets/images/icon_wan_android_round.png",
                      ),
                      width: 48,
                      height: 48,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Text("Awesome WanAndroid"),
                    ),
                    Container(
                      child: Text(
                        appInfo,
                        style: TextStyle(color: Colors.black),
                      ),
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(aboutwe),
                    ),
                  ],
                ),
              );
            }, childCount: 1),
          )
        ],
      ),
    );
  }
}
