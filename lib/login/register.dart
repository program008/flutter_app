import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/view/loading_dialog.dart';
import 'package:flutter_app/view/progress_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_info_entity.dart';

class Register extends StatefulWidget {
  final String title = '快速注册';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _phoneState, _pwdState, _pwdState2 = false;
  String _checkStr;
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _pwdcontroller = TextEditingController();
  TextEditingController _pwdcontroller2 = TextEditingController();

  void _checkPhone() {
//    if (_phonecontroller.text.isNotEmpty &&
//        _phonecontroller.text.trim().length == 11) {
    _phoneState = true;
//    } else {
//      _phoneState = false;
//    }
  }

  void _checkPwd() {
//    if (_pwdcontroller.text.isNotEmpty &&
//        _pwdcontroller.text.trim().length >= 6 &&
//        _pwdcontroller.text.trim().length <= 10) {
    _pwdState = true;
//    } else {
//      _pwdState = false;
//    }
  }

  void _checkPwd2() {
    if (_pwdcontroller2.text.isNotEmpty &&
        _pwdcontroller2.text.trim().length >= 6 &&
        _pwdcontroller2.text.trim().length <= 10) {
      _pwdState2 = true;
    } else {
      _pwdState2 = false;
    }
  }

  Future<LoginInfoEntity> register(
      String username, String password, String repassword) async {
    print("username $username password $password repassword $repassword");

    var dio = Dio();
    Response<String> response = await dio
        .post("https://www.wanandroid.com/user/register", queryParameters: {
      "username": username,
      "password": password,
      "repassword": repassword
    });

    LoginInfoEntity loginInfoEntity =
        EntityFactory.generateOBJ<LoginInfoEntity>(jsonDecode(response.data));
    return loginInfoEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('快速注册'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Image.asset(
                    'assets/images/ic_launcher.png',
                    scale: 1.2,
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                child: Stack(
                  alignment: Alignment(1.0, 1.0),
                  //statck
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                            child: Image.asset(
                              'assets/images/icon_username.png',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _phonecontroller,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: '请输入用户名',
                              ),
                            ),
                          ),
                        ]),
                    IconButton(
                      icon: Icon(Icons.clear, color: Colors.black45),
                      onPressed: () {
                        _phonecontroller.clear();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                        child: Image.asset(
                          'assets/images/icon_password.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _pwdcontroller,
                          decoration: InputDecoration(
                            hintText: '请输入密码',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear, color: Colors.black45),
                              onPressed: () {
                                _pwdcontroller.clear();
                              },
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                        child: Image.asset(
                          'assets/images/icon_password.png',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _pwdcontroller2,
                          decoration: InputDecoration(
                            hintText: '请再次输入密码',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear, color: Colors.black45),
                              onPressed: () {
                                _pwdcontroller2.clear();
                              },
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ]),
              ),
              Container(
                width: 340.0,
                child: Card(
                  color: Colors.blue,
                  elevation: 16.0,
                  child: FlatButton(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '注册',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                    onPressed: () {
                      _checkPhone();
                      _checkPwd();
                      if (_phoneState &&
                          _pwdState &&
                          (_pwdcontroller.text == _pwdcontroller2.text)) {
                        _checkStr = '页面跳转下期见咯！';
                        Navigator.push(context,
                            DialogRouter(LoadingDialog(true, title: "注册中...")));

                        Future<LoginInfoEntity>.delayed(Duration(seconds: 2),
                            () {
                          return register(
                              _phonecontroller.text.trim(),
                              _pwdcontroller.text.trim(),
                              _pwdcontroller2.text.trim());
                        }).then((data) async {
                          //执行成功会走到这里
                          print(data);
                          if (data.errorCode == 0) {
                            Navigator.of(context).pop();
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("注册失败"),
                                    content: Text("${data.errorMsg}"),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0))),
                                    //设置圆角,
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("确定"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          }
                        }).catchError((e) {
                          //执行失败会走到这里
                          print(e);
                        }).whenComplete(() {
                          //无论成功或失败都会走到这里
                          print('结束');
                          Navigator.of(context).pop();
                        });
                      }

                      print("_checkStr $_checkStr");
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
