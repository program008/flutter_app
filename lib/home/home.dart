import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';

import 'adpicture.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  List<BannerData> bannerList = [];

  @override
  void initState() {
    loadAdPictures().then((List<BannerData> banner) {
      setState(() {
        bannerList = banner;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 900,
            height: 500,
            child: BannerSwiper(
              //width  和 height 是图片的高宽比  不用传具体的高宽   必传
              height: 5,
              width: 9,
              //轮播图数目 必传
              length: bannerList.length,
              spaceMode: false,
              showIndicator: false,
              //轮播的item  widget 必传
              getwidget: (index) {
                return new GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          bannerList[index % bannerList.length].imagePath,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: 900,
                          margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  bannerList[index % bannerList.length].title,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Text(
                                  "${index % bannerList.length}/${bannerList.length}",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      //点击后todo
                    });
              },
            ),
          ),
        ],
      )),
    );
  }
}

Future<List<BannerData>> loadAdPictures() async {
  Dio dio = Dio();
  Response<String> response =
      await dio.get("https://www.wanandroid.com/banner/json");
  var banner = BannerEntity.fromJson(jsonDecode(response.data));
  return banner.data;
}
