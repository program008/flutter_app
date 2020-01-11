import 'package:flutter/material.dart';

class FictionPage extends StatefulWidget {
  String _title;

  FictionPage(this._title);

  @override
  _FictionPageSate createState() => _FictionPageSate();
}

class _FictionPageSate extends State<FictionPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget._title),
    );
  }
}
