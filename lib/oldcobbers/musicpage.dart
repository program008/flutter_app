import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  String _title;

  MusicPage(this._title);

  @override
  _MusicPageSate createState() => _MusicPageSate();
}

class _MusicPageSate extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget._title),
    );
  }
}
