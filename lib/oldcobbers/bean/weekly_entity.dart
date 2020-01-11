class WeeklyEntity {
  List<WeeklySubject> subjects;
  String title;

  WeeklyEntity({this.subjects, this.title});

  WeeklyEntity.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = new List<WeeklySubject>();
      (json['subjects'] as List).forEach((v) {
        subjects.add(new WeeklySubject.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class WeeklySubject {
  WeeklySubjectsSubject subject;
  int delta;
  int rank;

  WeeklySubject({this.subject, this.delta, this.rank});

  WeeklySubject.fromJson(Map<String, dynamic> json) {
    subject = json['subject'] != null
        ? new WeeklySubjectsSubject.fromJson(json['subject'])
        : null;
    delta = json['delta'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['delta'] = this.delta;
    data['rank'] = this.rank;
    return data;
  }
}

class WeeklySubjectsSubject {
  WeeklySubjectsSubjectImages images;
  String originalTitle;
  String year;
  List<WeeklySubjectsSubjectDirector> directors;
  WeeklySubjectsSubjectRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<WeeklySubjectsSubjectCast> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  WeeklySubjectsSubject(
      {this.images,
      this.originalTitle,
      this.year,
      this.directors,
      this.rating,
      this.alt,
      this.title,
      this.collectCount,
      this.hasVideo,
      this.pubdates,
      this.casts,
      this.subtype,
      this.genres,
      this.durations,
      this.mainlandPubdate,
      this.id});

  WeeklySubjectsSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new WeeklySubjectsSubjectImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<WeeklySubjectsSubjectDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new WeeklySubjectsSubjectDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new WeeklySubjectsSubjectRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<WeeklySubjectsSubjectCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new WeeklySubjectsSubjectCast.fromJson(v));
      });
    }
    subtype = json['subtype'];
    genres = json['genres']?.cast<String>();
    durations = json['durations']?.cast<String>();
    mainlandPubdate = json['mainland_pubdate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['original_title'] = this.originalTitle;
    data['year'] = this.year;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['alt'] = this.alt;
    data['title'] = this.title;
    data['collect_count'] = this.collectCount;
    data['has_video'] = this.hasVideo;
    data['pubdates'] = this.pubdates;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['subtype'] = this.subtype;
    data['genres'] = this.genres;
    data['durations'] = this.durations;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['id'] = this.id;
    return data;
  }
}

class WeeklySubjectsSubjectImages {
  String small;
  String large;
  String medium;

  WeeklySubjectsSubjectImages({this.small, this.large, this.medium});

  WeeklySubjectsSubjectImages.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class WeeklySubjectsSubjectDirector {
  String name;
  String alt;
  String id;
  WeeklySubjectsSubjectDirectorsAvatars avatars;
  String nameEn;

  WeeklySubjectsSubjectDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  WeeklySubjectsSubjectDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new WeeklySubjectsSubjectDirectorsAvatars.fromJson(json['avatars'])
        : null;
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    return data;
  }
}

class WeeklySubjectsSubjectDirectorsAvatars {
  String small;
  String large;
  String medium;

  WeeklySubjectsSubjectDirectorsAvatars({this.small, this.large, this.medium});

  WeeklySubjectsSubjectDirectorsAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class WeeklySubjectsSubjectRating {
  double average;
  int min;
  int max;

  String stars;

  WeeklySubjectsSubjectRating({this.average, this.min, this.max, this.stars});

  WeeklySubjectsSubjectRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['min'] = this.min;
    data['max'] = this.max;
    data['stars'] = this.stars;
    return data;
  }
}

class WeeklySubjectsSubjectCast {
  String name;
  String alt;
  String id;
  WeeklySubjectsSubjectCastsAvatars avatars;
  String nameEn;

  WeeklySubjectsSubjectCast(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  WeeklySubjectsSubjectCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new WeeklySubjectsSubjectCastsAvatars.fromJson(json['avatars'])
        : null;
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    return data;
  }
}

class WeeklySubjectsSubjectCastsAvatars {
  String small;
  String large;
  String medium;

  WeeklySubjectsSubjectCastsAvatars({this.small, this.large, this.medium});

  WeeklySubjectsSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}
