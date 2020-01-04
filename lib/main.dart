import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: Scaffold(
          appBar: AppBar(title: Text("douban"),),
          body: Center(child: Text("hello"),),
        ),
    );
  }
}


