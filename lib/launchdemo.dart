import 'package:css_colors/css_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  launchURL() {
    launch('https://flutter.dev');
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).primaryColor;
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: launchURL,
          child: Text('Show Flutter homepage',style: TextStyle(color: CSSColors.white),),
          color: colors,
        ),
      ),
    );
  }
}