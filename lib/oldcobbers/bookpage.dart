import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  String _title;

  BookPage(this._title);

  @override
  _BookPageSate createState() => _BookPageSate();
}

class _BookPageSate extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget._title),
    );
  }
}
