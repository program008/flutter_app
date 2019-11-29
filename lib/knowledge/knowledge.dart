import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../entity_factory.dart';
import 'kd_list_entity.dart';
import 'knowledge_detail.dart';

class KnowledgeWidget extends StatefulWidget {
  @override
  _KnowledgeState createState() => _KnowledgeState();
}

class _KnowledgeState extends State<KnowledgeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<KdListData>>(
            future: loadKd(),
            builder: (_, snapshot) {
              return snapshot.hasData
                  ? KdListWidget(buildContext:context,kdListData: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class KdListWidget extends StatelessWidget {
  BuildContext buildContext;
  // Generate a random color.
  final random = Random();
  List<KdListData> kdListData;

  KdListWidget({Key key, this.buildContext,@required this.kdListData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.all(5.0),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemBuilder: (_, index) {
              var content = StringBuffer();
              for (KdListDatachild kdListDatachild
                  in kdListData[index].children) {
                content.write(kdListDatachild.name);
                content.write(" ");
              }
              print("content：" + content.toString());
              var _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );
              return GestureDetector(
                onTap: () {
                  Navigator.of(buildContext).push(MaterialPageRoute(builder: (_) {
                    return KnowledgeDetail(kdListData: kdListData[index]);
                  }));
                },
                child: Card(
                  elevation: 5.0, //设置阴影
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(8.0))), //设置圆角
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "${kdListData[index].name}",
                          style: TextStyle(color: _color),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Text("${content.toString()}"),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: kdListData.length,
          ),
        ));
  }
}

/// 加载体系列表数据
Future<List<KdListData>> loadKd() async {
  Dio dio = Dio();
  Response<String> response =
      await dio.get("https://www.wanandroid.com/tree/json");
  var kdListEntity =
      EntityFactory.generateOBJ<KdListEntity>(jsonDecode(response.data));
  if (kdListEntity.errorCode == 0) {
    return kdListEntity.data;
  }
  return null;
}
