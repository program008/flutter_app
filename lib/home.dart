import 'package:flutter/material.dart';

/// 启动页，显示版本号，显示广告页，
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        body: Center(
          child: Text("home"),
        ),
      ),
    );
  }
}
