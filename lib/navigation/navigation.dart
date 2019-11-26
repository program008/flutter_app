import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: Center(
          child: Text("导航"),
        ),
      ),
    );
  }
}
