import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';

import 'home.dart';

void main() => runApp(MyApp());

/// 启动页，显示版本号，显示广告页，
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  Timer _timer;
  int _countdownTime = -1;

  /// 开始倒计时
  void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);
    var callback = (timer) => {
          setState(() {
            if (_countdownTime < 1) {
              _timer.cancel();
              next(context);
            } else {
              _countdownTime = _countdownTime - 1;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_countdownTime == -1) {
      setState(() {
        _countdownTime = 7;
      });
      //开始计时器
      startCountdownTimer();
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(color: Colors.black12),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text("广告区域"),
                    ),
                    Positioned(
                      top: 50,
                      right: 15,
                      child: Container(
                        width: 50,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: GestureDetector(
                          child: Text(
                            "跳过$_countdownTime",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          onTap: () {
                            if (_timer != null) {
                              _timer.cancel();
                            }
                            ////跳转并关闭当前页面
                            next(context);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/ic_screen_shot_logo.png",
                      width: 102,
                      height: 45,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                      child: FutureBuilder<PackageInfo>(
                        future: version(),
                        builder: (_, snapshot) {
                          return snapshot.hasData
                              ? Text(
                                  "${snapshot.data.version}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                )
                              : Text("");
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void next(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) {
        return HomeApp();
      }),
      (route) => route == null,
    );
  }

  /// 获取应用的pack info
  Future<PackageInfo> version() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print("版本信息：$packageInfo");
    return packageInfo;
  }
}
