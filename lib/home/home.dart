import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          body: Center(
            child: Text("首页"),
          )),
    );
  }
}
