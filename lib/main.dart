import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';
import 'package:flutter_app/main_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: JsonPicPage(),
    );
  }
}

class JsonPicPage extends StatelessWidget {
  Future<Widget> loadPic(String pic) async {
    var instance = Fluttie();
    var emojiComposition = await instance.loadAnimationFromAsset(
      "assets/images/$pic.json", //Replace this string with your actual file
    );

    // This creates the controller
    var emojiAnimation = await instance.prepareAnimation(emojiComposition,
        repeatCount: RepeatCount.infinite());
    emojiAnimation.start();
    return FluttieAnimation(emojiAnimation);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      print("定时结束，进入主界面");
//      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//        return MainApp();
//      }));
      ////跳转并关闭当前页面
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) {
          return MainApp();
        }),
        (route) => route == null,
      );
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/icon_wan_android.png"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FutureBuilder<Widget>(
                  future: loadPic("W"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
                FutureBuilder<Widget>(
                  future: loadPic("A"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
                FutureBuilder<Widget>(
                  future: loadPic("N"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FutureBuilder<Widget>(
                  future: loadPic("A"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
                FutureBuilder<Widget>(
                  future: loadPic("N"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
                FutureBuilder<Widget>(
                  future: loadPic("D"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 420, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FutureBuilder<Widget>(
                  future: loadPic("R"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
                FutureBuilder<Widget>(
                  future: loadPic("O"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 520, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FutureBuilder<Widget>(
                  future: loadPic("I"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
                FutureBuilder<Widget>(
                  future: loadPic("D"),
                  builder: (_, snapshot) {
                    return snapshot.hasData ? snapshot.data : Center();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
