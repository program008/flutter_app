import 'package:flutter/material.dart';

class LocalPage extends StatefulWidget {
  String _title;

  LocalPage(this._title);

  @override
  _LocalPageSate createState() => _LocalPageSate();
}

class _LocalPageSate extends State<LocalPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget._title),
    );
  }
}
