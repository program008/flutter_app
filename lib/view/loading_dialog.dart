import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  String title;
  LoadingDialog(this.canceledOnTouchOutside,{this.title}) : super();

  ///点击背景是否能够退出
  final bool canceledOnTouchOutside;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(

          ///背景透明
          color: Colors.transparent,

          ///保证控件居中效果
          child: Stack(
            children: <Widget>[
              GestureDetector(
                ///点击事件
                onTap: () {
                  if (canceledOnTouchOutside) {
                    Navigator.pop(context);
                  }
                },
              ),
              _dialog()
            ],
          )),
    );
  }

  Widget _dialog() {
    return Center(
      ///弹框大小
      child: SizedBox(
        width: 120.0,
        height: 120.0,
        child: Container(
          ///弹框背景和圆角
          decoration: ShapeDecoration(
            color: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: Text(
                  "${title??"加载中"}",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DialogRouter extends PageRouteBuilder{

  final Widget page;

  DialogRouter(this.page)
      : super(
    opaque: false,
    barrierColor: Colors.black54,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
  );
}
