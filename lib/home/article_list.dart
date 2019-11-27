class ArticleList {
  DataBean data;
  int errorCode;
  String errorMsg;

  ArticleList({this.data, this.errorCode, this.errorMsg});

  factory ArticleList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ArticleList articleListBean = ArticleList();
    articleListBean.data = DataBean.fromMap(map['data']);
    articleListBean.errorCode = map['errorCode'];
    articleListBean.errorMsg = map['errorMsg'];
    return articleListBean;
  }

  @override
  String toString() {
    return 'ArticleList{data: $data, errorCode: $errorCode, errorMsg: $errorMsg}';
  }
}

/// curPage : 2
/// datas : [{"apkLink":"","audit":1,"author":"互联网侦察","chapterId":421,"chapterName":"互联网侦察","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10469,"link":"https://mp.weixin.qq.com/s/jp88-0B50T8Zph6UohCkTA","niceDate":"2019-11-22","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574352000000,"selfVisible":0,"shareDate":1574599005000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/421/1"}],"title":"详解三道一维的动态规划算法题","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"code小生","chapterId":414,"chapterName":"code小生","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10455,"link":"https://mp.weixin.qq.com/s/OTwwVI7JIP6XL74H-yet3Q","niceDate":"2019-11-21","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598577000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/414/1"}],"title":"MySQL 面试题 24 问","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10459,"link":"https://mp.weixin.qq.com/s/ituGkYxHZIShNCRZyxlFZA","niceDate":"2019-11-21","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598686000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"https://mp.weixin.qq.com/s/gop8vNaK8LFADRQijAjgrA","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"郭霖","chapterId":409,"chapterName":"郭霖","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10463,"link":"https://mp.weixin.qq.com/s/4QcOMl-cNCCMt_N-Ppeo5Q","niceDate":"2019-11-21","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598816000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/409/1"}],"title":"视频技术加个餐，学习使用OpenGl来渲染视频！","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"谷歌开发者","chapterId":415,"chapterName":"谷歌开发者","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10467,"link":"https://mp.weixin.qq.com/s/DEI4bcmKkRBySUjO2AYEJA","niceDate":"2019-11-21","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598950000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/415/1"}],"title":"开启全面屏体验 | 手势导航 (一)","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"程序亦非猿","chapterId":428,"chapterName":"程序亦非猿","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10470,"link":"https://mp.weixin.qq.com/s/QIxRRG3o6B1ElAjKfTVpkA","niceDate":"2019-11-21","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574599040000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/428/1"}],"title":"如何回答性能优化的问题，才能打动阿里面试官？","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"程序亦非猿","chapterId":428,"chapterName":"程序亦非猿","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10471,"link":"https://mp.weixin.qq.com/s/E_u0X6ogjzw5ZVjCz7ne5Q","niceDate":"2019-11-21","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574599066000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/428/1"}],"title":"Gradle Builds Everything &mdash;&mdash; Task 实例","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"iceCola7","chapterId":402,"chapterName":"跨平台应用","collect":false,"courseId":13,"desc":"项目基于 Google 推出的一款用于创建跨平台、高性能的移动应用框架&mdash;&mdash;Flutter ，采用 Dart 语言编写，打造一款优秀的 WanAndroid 客户端，项目会持续迭代更新。","envelopePic":"https://www.wanandroid.com/blogimgs/1d2ee0cc-2cef-45fb-9e13-c073bc561e0d.png","fresh":false,"id":10406,"link":"https://www.wanandroid.com/blog/show/2705","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"https://github.com/iceCola7/flutter_wanandroid","publishTime":1574260728000,"selfVisible":0,"shareDate":1574260728000,"shareUser":"","superChapterId":294,"superChapterName":"开源项目主Tab","tags":[{"name":"项目","url":"/project/list/1?cid=402"}],"title":"Flutter 版 WanAndroid 客户端","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10401,"link":"https://juejin.im/post/5dd4ff0a5188254e172d57f0","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"","publishTime":1574241893000,"selfVisible":0,"shareDate":1574241893000,"shareUser":"winlee28","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"Android Jetpack架构组件 &mdash; Lifecycle入坑指南","type":0,"userId":25211,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10398,"link":"https://juejin.im/post/5d6bce24f265da03db0790d1","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"","publishTime":1574222765000,"selfVisible":0,"shareDate":1574222749000,"shareUser":"一包纯牛奶","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"打造一个丝滑般自动轮播无限循环Android库","type":0,"userId":27880,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10397,"link":"https://juejin.im/post/5d74d3faf265da03b5747015","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"","publishTime":1574222573000,"selfVisible":0,"shareDate":1574222573000,"shareUser":"一包纯牛奶","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"BannerViewPager源码解析","type":0,"userId":27880,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":505,"chapterName":"LeakCanary","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10381,"link":"https://juejin.im/post/5a9d46d2f265da237d0280a3","niceDate":"2019-11-20","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574180460000,"selfVisible":0,"shareDate":1574139942000,"shareUser":"秉心说","superChapterId":461,"superChapterName":"常见开源库源码解析","tags":[],"title":"LeakCanary 源码解析","type":0,"userId":22057,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":78,"chapterName":"性能优化","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10379,"link":"https://juejin.im/post/5c73388c518825629e062232","niceDate":"2019-11-20","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574180400000,"selfVisible":0,"shareDate":1574126292000,"shareUser":"灰丨色","superChapterId":191,"superChapterName":"热门专题","tags":[],"title":"Android性能优化：手把手教你如何让App更快、更稳、更省","type":0,"userId":28694,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":423,"chapterName":"Architecture","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10388,"link":"https://github.com/KunMinX/Jetpack-MVVM-Best-Practice","niceDate":"2019-11-20","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574180380000,"selfVisible":0,"shareDate":1574167493000,"shareUser":"鸿洋","superChapterId":423,"superChapterName":"Jetpack","tags":[],"title":"KunMinX/Jetpack-MVVM-Best-Practice: 是 难得一见 的 Jetpack MVVM 最佳实践！","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"鸿洋","chapterId":408,"chapterName":"鸿洋","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10458,"link":"https://mp.weixin.qq.com/s/gop8vNaK8LFADRQijAjgrA","niceDate":"2019-11-20","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574179200000,"selfVisible":0,"shareDate":1574598645000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/408/1"}],"title":"9102年了，再谈屏幕适配！","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"郭霖","chapterId":409,"chapterName":"郭霖","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10462,"link":"https://mp.weixin.qq.com/s/Jp2wbwVCec3mAt08-0aBdg","niceDate":"2019-11-20","niceShareDate":"2天前","origin":"","prefix":"","projectLink":"","publishTime":1574179200000,"selfVisible":0,"shareDate":1574598772000,"shareUser":"","superChapterId":408,"superChapterName":"公众号","tags":[{"name":"公众号","url":"/wxarticle/list/409/1"}],"title":"网络请求只会用Retrofit？外国人已经在用Apollo Graphql了","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"自助","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10383,"link":"https://juejin.im/post/5dd3983c51882530702df6c5","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574149005000,"selfVisible":0,"shareDate":1574149005000,"shareUser":"winlee28","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"还不知道Android Jetpack是什么？你就out了","type":0,"userId":25211,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":182,"chapterName":"JNI编程","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10368,"link":"https://juejin.im/post/5dd22ecd5188252a091e9b47","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574095298000,"selfVisible":0,"shareDate":1574094614000,"shareUser":"鸿洋","superChapterId":182,"superChapterName":"JNI","tags":[],"title":"从零开始仿写一个抖音App&mdash;&mdash;视频编辑SDK开发(一)","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":423,"chapterName":"Architecture","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10373,"link":"https://www.jianshu.com/p/7491750f7988?utm_source=desktop&amp;utm_medium=timeline","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574095208000,"selfVisible":0,"shareDate":1574094887000,"shareUser":"鸿洋","superChapterId":423,"superChapterName":"Jetpack","tags":[],"title":"Android Jetpack架构组件之Lifecycle入门","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":229,"chapterName":"AOP","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10374,"link":"https://www.jianshu.com/p/c40528c8df17?utm_source=desktop&amp;utm_medium=timeline","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574095199000,"selfVisible":0,"shareDate":1574094893000,"shareUser":"鸿洋","superChapterId":227,"superChapterName":"注解 & 反射 & AOP","tags":[],"title":"Android开发中的AOP技术","type":0,"userId":2,"visible":1,"zan":0}]
/// offset : 20
/// over : false
/// pageCount : 378
/// size : 20
/// total : 7560

class DataBean {
  int curPage;
  List<DatasBean> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  DataBean(
      {this.curPage,
      this.datas,
      this.offset,
      this.over,
      this.pageCount,
      this.size,
      this.total});

  factory DataBean.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.curPage = map['curPage'];
    dataBean.datas = List()
      ..addAll((map['datas'] as List ?? []).map((o) => DatasBean.fromMap(o)));
    dataBean.offset = map['offset'];
    dataBean.over = map['over'];
    dataBean.pageCount = map['pageCount'];
    dataBean.size = map['size'];
    dataBean.total = map['total'];
    return dataBean;
  }

  @override
  String toString() {
    return 'DataBean{curPage: $curPage, datas: $datas, offset: $offset, over: $over, pageCount: $pageCount, size: $size, total: $total}';
  }
}

/// apkLink : ""
/// audit : 1
/// author : "互联网侦察"
/// chapterId : 421
/// chapterName : "互联网侦察"
/// collect : false
/// courseId : 13
/// desc : ""
/// envelopePic : ""
/// fresh : false
/// id : 10469
/// link : "https://mp.weixin.qq.com/s/jp88-0B50T8Zph6UohCkTA"
/// niceDate : "2019-11-22"
/// niceShareDate : "2天前"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1574352000000
/// selfVisible : 0
/// shareDate : 1574599005000
/// shareUser : ""
/// superChapterId : 408
/// superChapterName : "公众号"
/// tags : [{"name":"公众号","url":"/wxarticle/list/421/1"}]
/// title : "详解三道一维的动态规划算法题"
/// type : 0
/// userId : -1
/// visible : 1
/// zan : 0

class DatasBean {
  String apkLink;
  int audit;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<TagsBean> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  DatasBean();

  factory DatasBean.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DatasBean datasBean = DatasBean();
    datasBean.apkLink = map['apkLink'];
    datasBean.audit = map['audit'];
    datasBean.author = map['author'];
    datasBean.chapterId = map['chapterId'];
    datasBean.chapterName = map['chapterName'];
    datasBean.collect = map['collect'];
    datasBean.courseId = map['courseId'];
    datasBean.desc = map['desc'];
    datasBean.envelopePic = map['envelopePic'];
    datasBean.fresh = map['fresh'];
    datasBean.id = map['id'];
    datasBean.link = map['link'];
    datasBean.niceDate = map['niceDate'];
    datasBean.niceShareDate = map['niceShareDate'];
    datasBean.origin = map['origin'];
    datasBean.prefix = map['prefix'];
    datasBean.projectLink = map['projectLink'];
    datasBean.publishTime = map['publishTime'];
    datasBean.selfVisible = map['selfVisible'];
    datasBean.shareDate = map['shareDate'];
    datasBean.shareUser = map['shareUser'];
    datasBean.superChapterId = map['superChapterId'];
    datasBean.superChapterName = map['superChapterName'];
    datasBean.tags = List()
      ..addAll((map['tags'] as List ?? []).map((o) => TagsBean.fromMap(o)));
    datasBean.title = map['title'];
    datasBean.type = map['type'];
    datasBean.userId = map['userId'];
    datasBean.visible = map['visible'];
    datasBean.zan = map['zan'];
    return datasBean;
  }

  @override
  String toString() {
    return 'DatasBean{apkLink: $apkLink, audit: $audit, author: $author, '
        'chapterId: $chapterId, chapterName: $chapterName, collect: $collect, '
        'courseId: $courseId, desc: $desc, envelopePic: $envelopePic, '
        'fresh: $fresh, id: $id, link: $link, niceDate: $niceDate, '
        'niceShareDate: $niceShareDate, origin: $origin, prefix: $prefix, '
        'projectLink: $projectLink, publishTime: $publishTime, '
        'selfVisible: $selfVisible, shareDate: $shareDate, shareUser: $shareUser, '
        'superChapterId: $superChapterId, superChapterName: $superChapterName, '
        'tags: $tags, title: $title, type: $type, userId: $userId, '
        'visible: $visible, zan: $zan}';
  }
}

/// name : "公众号"
/// url : "/wxarticle/list/421/1"

class TagsBean {
  String name;
  String url;

  TagsBean({this.name, this.url});

  factory TagsBean.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    TagsBean tagsBean = TagsBean();
    tagsBean.name = map['name'];
    tagsBean.url = map['url'];
    return tagsBean;
  }

  @override
  String toString() {
    return 'TagsBean{name: $name, url: $url}';
  }
}
