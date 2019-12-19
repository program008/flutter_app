import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/mvvm/helper/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RoutePageWithValue("已经是最后一页啦"),
    );
  }
}

class RoutePageWithValue extends StatelessWidget {
  final String lastPageName;

  BuildContext context;

  RoutePageWithValue(this.lastPageName);
  var currentTime = 0;
  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(content: new Text('退出app'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            },
            child: new Text('确定'))
      ]),
    );
  }

  Future<bool> _requestPop() {
    print("返回键触发");
    //_showDialog();
    if(DateTime.now().millisecondsSinceEpoch - currentTime <2000){
      Navigator.pop(context);
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      } else {
        SystemNavigator.pop();
      }
    }else{
      currentTime = DateTime.now().millisecondsSinceEpoch;
      Toast.show("再点一次退出", context,gravity: Toast.BOTTOM);
    }
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //监听左上角返回和实体返回WillPopScope
    return new WillPopScope(
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text('RoutePageWithValue'),
              centerTitle: true,
            ),
            body: new Center(
              child: new Text('$lastPageName'),
            )),
        onWillPop: _requestPop);
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _shareWidget() {
      return new Container(
        height: 250.0,
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: new Container(
                height: 190.0,
                child: new GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1.0),
                  itemBuilder: (BuildContext context, int index) {
                    return new Column(
                      children: <Widget>[
                        new Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                            child: Icon(
                              Icons.ac_unit,
                              size: 50,
                            )),
                        new Text(nameItems[index])
                      ],
                    );
                  },
                  itemCount: nameItems.length,
                ),
              ),
            ),
            new Container(
              height: 0.5,
              color: Colors.blueGrey,
            ),
            new Center(
              child: new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text(
                      '取  消',
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                    )),
              ),
            ),
          ],
        ),
      );
    }

    void showPub() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return _shareWidget();
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("底部对话框"),
      ),
      body: Center(
          child: RaisedButton(
        child: Text("显示"),
        onPressed: () {
          showPub();
        },
      )),
    );
  }
}

List<String> nameItems = <String>[
  '微信',
  '朋友圈',
  'QQ',
  'QQ空间',
  '微博',
  'FaceBook',
  '邮件',
  '链接'
];

// 这个urlItems这里没有用到
List<String> urlItems = <String>[
  'xz.png',
  'xz.png',
  'xz.png',
  'xz.png',
  'xz.png',
  'xz.png',
  'xz.png',
  'xz.png'
];
