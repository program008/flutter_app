import 'package:flutter/material.dart';
import 'dart:math';

/// 小星星等级显示
class StarRating extends StatelessWidget {
  double _average;

  StarRating(this._average);

  //计算星星数
  List<Widget> calculate(double average) {
    List<Widget> starts = [];
    int startOnCount = 0;
    int startHalfCount = 0;
    int startOffCount = 0;
    int score = average.floor();
    startOnCount = score ~/ 2;
    if (score % 2 != 0) {
      startHalfCount = 1;
    }
    startOffCount = 5 - startOnCount - startHalfCount;

    //显示对于的star
    //全星
    for (int i = 0; i < startOnCount; i++) {
      starts.add(
        Image.asset(
          "assets/images/rating_star_xsmall_on.png",
          width: 14,
          height: 14,
        ),
      );
    }
    //半星
    for (int i = 0; i < startHalfCount; i++) {
      starts.add(
        Image.asset(
          "assets/images/rating_star_xsmall_half.png",
          width: 14,
          height: 14,
        ),
      );
    }
    //空星
    for (int i = 0; i < startOffCount; i++) {
      starts.add(
        Image.asset(
          "assets/images/rating_star_xsmall_off.png",
          width: 14,
          height: 14,
        ),
      );
    }
    //添加分数
    starts.add(Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Text(
        "${average}",
        style: TextStyle(color: Color(0xff909090), fontSize: 10),
      ),
    ));
    return starts;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: calculate(_average),
      ),
    );
  }
}
