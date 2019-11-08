import 'package:flutter_app/banner_entity.dart';
import 'package:flutter_app/person_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerEntity") {
      return BannerEntity.fromJson(json) as T;
    } else if (T.toString() == "PersonEntity") {
      return PersonEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}