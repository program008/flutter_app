import 'package:flutter/material.dart';

/// 小组页
class GroupPage extends StatefulWidget {
  String _title;

  GroupPage(this._title);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}
