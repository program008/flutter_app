import 'dart:math' as math;

import 'package:dio/dio.dart';

import 'entity_factory.dart';
import 'oldcobbers/bean/top250_entity.dart';

typedef RequestCallBack<T> = void Function(T value);

class API {
  static const BASE_URL = 'https://api.douban.com';

  ///TOP250
  static const String TOP_250 = '/v2/movie/top250';

  ///正在热映
  static const String IN_THEATERS =
      '/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///即将上映
  static const String COMING_SOON =
      '/v2/movie/coming_soon?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///一周口碑榜
  static const String WEEKLY =
      '/v2/movie/weekly?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///影人条目信息
  static const String CELEBRITY = '/v2/movie/celebrity/';

  static const String REIVIEWS = '/v2/movie/subject/26266893/reviews';

  // new Dio with a BaseOptions instance.
  Dio _request = new Dio(BaseOptions(
    baseUrl: API.BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  //var _request = HttpRequest(API.BASE_URL);

  Future<dynamic> _query(String uri, String value) async {
    final result = await _request
        .get('$uri$value?apikey=0b2bdeda43b5688921839c8ecb20399b');
    return result;
  }

  ///当日可播放电影已经更新
  void getTodayPlay(RequestCallBack requestCallBack) async {
    int start = math.Random().nextInt(220);
    var result = await _request.get(TOP_250 +
        '?start=$start&count=3&apikey=0b2bdeda43b5688921839c8ecb20399b');
    var data = result.data;
    print("data：$data");
    var entity = EntityFactory.generateOBJ<Top250Entity>(data);

    List<Top250Subject> list = entity.subjects;

    List<String> todayUrls = [];
    todayUrls.add(list[0].images.medium);
    todayUrls.add(list[1].images.medium);
    todayUrls.add(list[2].images.medium);
    requestCallBack(todayUrls);
  }

  void top250(RequestCallBack requestCallBack, {count = 250}) async {
    var result = await _request.get(TOP_250 +
        '?start=0&count=$count&apikey=0b2bdeda43b5688921839c8ecb20399b');
    var resultList = result.data['subjects'];
//    List<Subject> list =
//        resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
//    requestCallBack(list);
  }

  ///影院热映 + 即将上映
  void getHotComingSoon(RequestCallBack requestCallBack) async {
    //影院热映
    var result = await _request.get(IN_THEATERS + "&count=6");
    var entity = EntityFactory.generateOBJ<Top250Entity>(result.data);
    var hots = entity.subjects;

    //即将上映
    result = await _request.get(COMING_SOON + "&count=6");
    var entity2 = EntityFactory.generateOBJ<Top250Entity>(result.data);
    var comingSoons = entity2.subjects;
    requestCallBack({'hots': hots, 'comingSoons': comingSoons,'total':entity.total,'total2':entity2.total});
  }

  ///影院热映 https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b
  void getIntheaters(RequestCallBack requestCallBack) async {
    var result = await _request.get(IN_THEATERS);
    var resultList = result.data['subjects'];
//    List<Subject> list =
//        resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
//    requestCallBack(list);
  }

  ///https://api.douban.com/v2/movie/coming_soon?apikey=0b2bdeda43b5688921839c8ecb20399b
  ///即将上映
  void commingSoon(RequestCallBack requestCallBack) async {
    var result = await _request
        .get(COMING_SOON + '?apikey=0b2bdeda43b5688921839c8ecb20399b');
    var resultList = result.data['subjects'];
//    List<Subject> list =
//        resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
//    requestCallBack(list);
  }

  ///豆瓣热门
  void getHot(RequestCallBack requestCallBack) async {
    ///随机生成热门
    int start = math.Random().nextInt(220);
    var result = await _request.get(TOP_250 + '?start=$start&count=7');
    var resultList = result.data['subjects'];
//    List<Subject> list =
//        resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
//    requestCallBack(list);
  }

  void getWeekly(RequestCallBack requestCallBack) async {
    var result = await _request.get(WEEKLY);
    var resultList = result.data['subjects'];
//    List<SubjectEntity> list = resultList
//        .map<SubjectEntity>((item) => SubjectEntity.fromMap(item))
//        .toList();
//    requestCallBack(list);
  }

  ///26266893 电影条目信息
  ///https://api.douban.com/v2/movie/subject/26266893?apikey=0b2bdeda43b5688921839c8ecb20399b
  void getMovieDetail(subjectId, RequestCallBack requestCallBack) async {
    final result = await _request.get(
        '/v2/movie/subject/$subjectId?apikey=0b2bdeda43b5688921839c8ecb20399b');
  }

  ///电影短评
  ///https://api.douban.com/v2/movie/subject/26266893/comments?apikey=0b2bdeda43b5688921839c8ecb20399b
  void getComments(subjectId, RequestCallBack requestCallBack) async {
    final result = await _request.get(
        '/v2/movie/subject/$subjectId/comments?apikey=0b2bdeda43b5688921839c8ecb20399b');
  }

  /// 根据关键字搜索 电影  https://api.douban.com/v2/movie/search?q=%E6%B5%81%E6%B5%AA&apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=10
  /// 根据关键字搜索 书记 https://api.douban.com/v2/book/search?q=%E6%B5%81%E6%B5%AA&apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=10
  /// 根据关键字搜索 音乐 https://api.douban.com/v2/music/search?q=%E6%B5%81%E6%B5%AA&apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=10
  void searchMovie(
      String searchContent, RequestCallBack requestCallBack) async {
    final result = await _request.get(
        '/v2/movie/search?q=$searchContent&apikey=0b2bdeda43b5688921839c8ecb20399b');
  }

  ///影人条目信息 https://api.douban.com/v2/movie/celebrity/1000525?apikey=0b2bdeda43b5688921839c8ecb20399b
  void searchCelebrity(String id, RequestCallBack requestCallBack) async {
    final result = await _query(CELEBRITY, id);
  }

  ///影人作品 https://api.douban.com/v2/movie/celebrity/1000525/works?apikey=0b2bdeda43b5688921839c8ecb20399b
  void searchCelebrityWorks(String id, RequestCallBack requestCallBack) async {
    final result = await _query(CELEBRITY, id);
  }

  ///电影长评 https://api.douban.com/v2/movie/subject/26266893/reviews?apikey=0b2bdeda43b5688921839c8ecb20399b
  void getMovieReviews(String id, RequestCallBack requestCallBack) async {
    final result = await _request.get(
        '/v2/movie/subject/$id/reviews?apikey=0b2bdeda43b5688921839c8ecb20399b');
  }
}
