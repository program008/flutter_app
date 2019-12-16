/**
 * 新增使用pageview实现方式：navigation——keep——alive
 * 这种方式能够通过子页面state实现AutomaticKeepAliveClientMixin
 * 达到切换各页面保持状态的效果。
 * 请切换home注释分别查看
 */
import 'package:flutter/material.dart';
import 'bottpm_navigation_weight.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
      home: BottomNavigationWidget(),
//    home: NavigationKeepAlive(),
    );
  }
}