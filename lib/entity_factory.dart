import 'package:flutter_app/home/article_list_entity.dart';
import 'package:flutter_app/knowledge/kd_list_entity.dart';
import 'package:flutter_app/navigation/navigation_list_entity.dart';
import 'package:flutter_app/search/common_sites_entity.dart';
import 'package:flutter_app/search/hot_search_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ArticleListEntity") {
      return ArticleListEntity.fromJson(json) as T;
    } else if (T.toString() == "KdListEntity") {
      return KdListEntity.fromJson(json) as T;
    } else if (T.toString() == "NavigationListEntity") {
      return NavigationListEntity.fromJson(json) as T;
    } else if (T.toString() == "CommonSitesEntity") {
      return CommonSitesEntity.fromJson(json) as T;
    } else if (T.toString() == "HotSearchEntity") {
      return HotSearchEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}