import 'package:flutter/material.dart';

/// 首頁
class HomePage extends StatefulWidget {
  String _title;

  HomePage(this._title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}
