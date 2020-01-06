import 'package:flutter/material.dart';

/// 书影音
class OldcobbersPage extends StatefulWidget {
  String _title;

  OldcobbersPage(this._title);

  @override
  _OldcobbersPageState createState() => _OldcobbersPageState();
}

class _OldcobbersPageState extends State<OldcobbersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}
