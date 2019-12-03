import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity_factory.dart';
import 'package:flutter_app/login/register.dart';
import 'package:flutter_app/view/loading_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_info_entity.dart';
import 'package:cookie_jar/cookie_jar.dart';
class Login extends StatefulWidget {
  final String title = '极速登录';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _phoneState, _pwdState = false;
  String _checkStr;
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _pwdcontroller = TextEditingController();

  void _checkPhone() {
//    if (_phonecontroller.text.isNotEmpty &&
//        _phonecontroller.text.trim().length == 11) {
    _phoneState = true;
//    } else {
//      _phoneState = false;
//    }
  }

  void _checkPwd() {
    if (_pwdcontroller.text.isNotEmpty &&
        _pwdcontroller.text.trim().length >= 6 &&
        _pwdcontroller.text.trim().length <= 10) {
      _pwdState = true;
    } else {
      _pwdState = false;
    }
  }

  Future<LoginInfoEntity> login(String username, String password) async {
    print("username $username password $password");
    var dio = Dio();
    var cookieJar=CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    Response<String> response = await dio.post(
        "https://www.wanandroid.com/user/login",
        queryParameters: {"username": username, "password": password});

    LoginInfoEntity loginInfoEntity =
        EntityFactory.generateOBJ<LoginInfoEntity>(jsonDecode(response.data));

    return loginInfoEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('极速登录'),
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
                    'assets/images/logo2.png',
                    scale: 1.2,
                    width: 120,
                    height: 120,
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
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 40.0),
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
              Container(
                width: 340.0,
                child: Card(
                  color: Colors.blue,
                  elevation: 16.0,
                  child: FlatButton(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '极速登录',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                    onPressed: () {
                      _checkPhone();
                      _checkPwd();
                      if (_phoneState && _pwdState) {
                        _checkStr = '页面跳转下期见咯！';
                        Navigator.push(context, DialogRouter(LoadingDialog(true,title:"登录中...")));

                        Future<LoginInfoEntity>.delayed(Duration(seconds: 2),(){
                          return login(_phonecontroller.text.trim(),
                              _pwdcontroller.text.trim());
                        }).then((data) async {
                          //执行成功会走到这里
                          print(data);
                          if (data.errorCode == 0) {
                            //登录成功
                            Fluttertoast.showToast(msg: '登录成功！');
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString("login", jsonEncode(data.data.toJson()));
                            Navigator.of(context).pop();
                          } else {
                            //登录失败
                            Fluttertoast.showToast(msg: data.errorMsg);
                          }
                        }).catchError((e){
                          //执行失败会走到这里
                          print(e);
                        }).whenComplete((){
                          //无论成功或失败都会走到这里
                          print('结束');
                          Navigator.of(context).pop();
                        });
                      } else {
                        if (!_phoneState) {
                          _checkStr = '请输入11位手机号！';
                        } else if (!_pwdState) {
                          _checkStr = '请输入6-10位密码！';
                        }
                      }

                      print("$_checkStr");
                    },
                  ),
                ),
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
                        '快速注册',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return Register();
                      }));
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
