## 玩Android of flutter

>学习flutter开发，使用[玩Android 开放API](https://www.wanandroid.com/blog/show/2)接口开发一个基于技术博客APP，
可以查看相关技术博客，并且可以将自己喜欢的文章收藏起来~~~

### 项目主要功能界面
##### 一，首页
![首页1](https://github.com/program008/flutter_app/blob/wanandroid/screens/%E9%A6%96%E9%A1%B501.png?raw=true)

+ 实现无限滚动轮播图
>     var bannerWidget = BannerSwiper(
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
                      Text("${index % bannerList.length}/${bannerList.length}",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              print("当前点击的是：$index");
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: bannerList[index % bannerList.length].url,
                  title: bannerList[index % bannerList.length].title,
                );
              }));
            });
      },
    );

+ 在flutter中涉及到异步更新列表数据的时候，可以使用FutuerBuild来封装。

>  FutureBuilder<List<ArticleListDataData>>(
            future: loadArticles(0),
            builder: (_, snapshot) {
              return snapshot.hasData
                   ? ArticleItem(buildContext: context, articles: snapshot.data)
                   : Center(child: CircularProgressIndicator());
            },
           )



##### 二，知识体系
##### 三，导航
##### 四，项目
##### 五，搜索页
##### 六，抽屉页

