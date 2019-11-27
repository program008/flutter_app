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
/// datas : [{"apkLink":"","audit":1,"author":"���������","chapterId":421,"chapterName":"���������","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10469,"link":"https://mp.weixin.qq.com/s/jp88-0B50T8Zph6UohCkTA","niceDate":"2019-11-22","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574352000000,"selfVisible":0,"shareDate":1574599005000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/421/1"}],"title":"�������һά�Ķ�̬�滮�㷨��","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"codeС��","chapterId":414,"chapterName":"codeС��","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10455,"link":"https://mp.weixin.qq.com/s/OTwwVI7JIP6XL74H-yet3Q","niceDate":"2019-11-21","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598577000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/414/1"}],"title":"MySQL ������ 24 ��","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"����","chapterId":408,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10459,"link":"https://mp.weixin.qq.com/s/ituGkYxHZIShNCRZyxlFZA","niceDate":"2019-11-21","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598686000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/408/1"}],"title":"https://mp.weixin.qq.com/s/gop8vNaK8LFADRQijAjgrA","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"����","chapterId":409,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10463,"link":"https://mp.weixin.qq.com/s/4QcOMl-cNCCMt_N-Ppeo5Q","niceDate":"2019-11-21","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598816000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/409/1"}],"title":"��Ƶ�����Ӹ��ͣ�ѧϰʹ��OpenGl����Ⱦ��Ƶ��","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"�ȸ迪����","chapterId":415,"chapterName":"�ȸ迪����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10467,"link":"https://mp.weixin.qq.com/s/DEI4bcmKkRBySUjO2AYEJA","niceDate":"2019-11-21","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574598950000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/415/1"}],"title":"����ȫ�������� | ���Ƶ��� (һ)","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"�������Գ","chapterId":428,"chapterName":"�������Գ","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10470,"link":"https://mp.weixin.qq.com/s/QIxRRG3o6B1ElAjKfTVpkA","niceDate":"2019-11-21","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574599040000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/428/1"}],"title":"��λش������Ż������⣬���ܴ򶯰������Թ٣�","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"�������Գ","chapterId":428,"chapterName":"�������Գ","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10471,"link":"https://mp.weixin.qq.com/s/E_u0X6ogjzw5ZVjCz7ne5Q","niceDate":"2019-11-21","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574265600000,"selfVisible":0,"shareDate":1574599066000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/428/1"}],"title":"Gradle Builds Everything &mdash;&mdash; Task ʵ��","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"iceCola7","chapterId":402,"chapterName":"��ƽ̨Ӧ��","collect":false,"courseId":13,"desc":"��Ŀ���� Google �Ƴ���һ�����ڴ�����ƽ̨�������ܵ��ƶ�Ӧ�ÿ��&mdash;&mdash;Flutter ������ Dart ���Ա�д������һ������� WanAndroid �ͻ��ˣ���Ŀ������������¡�","envelopePic":"https://www.wanandroid.com/blogimgs/1d2ee0cc-2cef-45fb-9e13-c073bc561e0d.png","fresh":false,"id":10406,"link":"https://www.wanandroid.com/blog/show/2705","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"https://github.com/iceCola7/flutter_wanandroid","publishTime":1574260728000,"selfVisible":0,"shareDate":1574260728000,"shareUser":"","superChapterId":294,"superChapterName":"��Դ��Ŀ��Tab","tags":[{"name":"��Ŀ","url":"/project/list/1?cid=402"}],"title":"Flutter �� WanAndroid �ͻ���","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10401,"link":"https://juejin.im/post/5dd4ff0a5188254e172d57f0","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"","publishTime":1574241893000,"selfVisible":0,"shareDate":1574241893000,"shareUser":"winlee28","superChapterId":494,"superChapterName":"�㳡Tab","tags":[],"title":"Android Jetpack�ܹ���� &mdash; Lifecycle���ָ��","type":0,"userId":25211,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10398,"link":"https://juejin.im/post/5d6bce24f265da03db0790d1","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"","publishTime":1574222765000,"selfVisible":0,"shareDate":1574222749000,"shareUser":"һ����ţ��","superChapterId":494,"superChapterName":"�㳡Tab","tags":[],"title":"����һ��˿�����Զ��ֲ�����ѭ��Android��","type":0,"userId":27880,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10397,"link":"https://juejin.im/post/5d74d3faf265da03b5747015","niceDate":"2019-11-20","niceShareDate":"2019-11-20","origin":"","prefix":"","projectLink":"","publishTime":1574222573000,"selfVisible":0,"shareDate":1574222573000,"shareUser":"һ����ţ��","superChapterId":494,"superChapterName":"�㳡Tab","tags":[],"title":"BannerViewPagerԴ�����","type":0,"userId":27880,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":505,"chapterName":"LeakCanary","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10381,"link":"https://juejin.im/post/5a9d46d2f265da237d0280a3","niceDate":"2019-11-20","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574180460000,"selfVisible":0,"shareDate":1574139942000,"shareUser":"����˵","superChapterId":461,"superChapterName":"������Դ��Դ�����","tags":[],"title":"LeakCanary Դ�����","type":0,"userId":22057,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":78,"chapterName":"�����Ż�","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10379,"link":"https://juejin.im/post/5c73388c518825629e062232","niceDate":"2019-11-20","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574180400000,"selfVisible":0,"shareDate":1574126292000,"shareUser":"��حɫ","superChapterId":191,"superChapterName":"����ר��","tags":[],"title":"Android�����Ż����ְ��ֽ��������App���졢���ȡ���ʡ","type":0,"userId":28694,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":423,"chapterName":"Architecture","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10388,"link":"https://github.com/KunMinX/Jetpack-MVVM-Best-Practice","niceDate":"2019-11-20","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574180380000,"selfVisible":0,"shareDate":1574167493000,"shareUser":"����","superChapterId":423,"superChapterName":"Jetpack","tags":[],"title":"KunMinX/Jetpack-MVVM-Best-Practice: �� �ѵ�һ�� �� Jetpack MVVM ���ʵ����","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"����","chapterId":408,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10458,"link":"https://mp.weixin.qq.com/s/gop8vNaK8LFADRQijAjgrA","niceDate":"2019-11-20","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574179200000,"selfVisible":0,"shareDate":1574598645000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/408/1"}],"title":"9102���ˣ���̸��Ļ���䣡","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"����","chapterId":409,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10462,"link":"https://mp.weixin.qq.com/s/Jp2wbwVCec3mAt08-0aBdg","niceDate":"2019-11-20","niceShareDate":"2��ǰ","origin":"","prefix":"","projectLink":"","publishTime":1574179200000,"selfVisible":0,"shareDate":1574598772000,"shareUser":"","superChapterId":408,"superChapterName":"���ں�","tags":[{"name":"���ں�","url":"/wxarticle/list/409/1"}],"title":"��������ֻ����Retrofit��������Ѿ�����Apollo Graphql��","type":0,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":502,"chapterName":"����","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10383,"link":"https://juejin.im/post/5dd3983c51882530702df6c5","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574149005000,"selfVisible":0,"shareDate":1574149005000,"shareUser":"winlee28","superChapterId":494,"superChapterName":"�㳡Tab","tags":[],"title":"����֪��Android Jetpack��ʲô�����out��","type":0,"userId":25211,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":182,"chapterName":"JNI���","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10368,"link":"https://juejin.im/post/5dd22ecd5188252a091e9b47","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574095298000,"selfVisible":0,"shareDate":1574094614000,"shareUser":"����","superChapterId":182,"superChapterName":"JNI","tags":[],"title":"���㿪ʼ��дһ������App&mdash;&mdash;��Ƶ�༭SDK����(һ)","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":423,"chapterName":"Architecture","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10373,"link":"https://www.jianshu.com/p/7491750f7988?utm_source=desktop&amp;utm_medium=timeline","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574095208000,"selfVisible":0,"shareDate":1574094887000,"shareUser":"����","superChapterId":423,"superChapterName":"Jetpack","tags":[],"title":"Android Jetpack�ܹ����֮Lifecycle����","type":0,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"","chapterId":229,"chapterName":"AOP","collect":false,"courseId":13,"desc":"","envelopePic":"","fresh":false,"id":10374,"link":"https://www.jianshu.com/p/c40528c8df17?utm_source=desktop&amp;utm_medium=timeline","niceDate":"2019-11-19","niceShareDate":"2019-11-19","origin":"","prefix":"","projectLink":"","publishTime":1574095199000,"selfVisible":0,"shareDate":1574094893000,"shareUser":"����","superChapterId":227,"superChapterName":"ע�� & ���� & AOP","tags":[],"title":"Android�����е�AOP����","type":0,"userId":2,"visible":1,"zan":0}]
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
/// author : "���������"
/// chapterId : 421
/// chapterName : "���������"
/// collect : false
/// courseId : 13
/// desc : ""
/// envelopePic : ""
/// fresh : false
/// id : 10469
/// link : "https://mp.weixin.qq.com/s/jp88-0B50T8Zph6UohCkTA"
/// niceDate : "2019-11-22"
/// niceShareDate : "2��ǰ"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1574352000000
/// selfVisible : 0
/// shareDate : 1574599005000
/// shareUser : ""
/// superChapterId : 408
/// superChapterName : "���ں�"
/// tags : [{"name":"���ں�","url":"/wxarticle/list/421/1"}]
/// title : "�������һά�Ķ�̬�滮�㷨��"
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

/// name : "���ں�"
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
