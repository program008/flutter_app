import 'package:flutter/material.dart';

/// 我的
class MePage extends StatefulWidget {
  String _title;

  MePage(this._title);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}
