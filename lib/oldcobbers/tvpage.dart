import 'package:flutter/material.dart';

class TvPage extends StatefulWidget {
  String _title;

  TvPage(this._title);

  @override
  _TvPageSate createState() => _TvPageSate();
}

class _TvPageSate extends State<TvPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget._title),
    );
  }
}
