import 'package:flutter/material.dart';

/// 市集頁
class FairPage extends StatefulWidget {
  String _title;

  FairPage(this._title);

  @override
  _FairPageState createState() => _FairPageState();
}

class _FairPageState extends State<FairPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}
