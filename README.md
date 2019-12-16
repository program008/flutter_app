## 玩Android of flutter

>学习flutter开发，使用[玩Android 开放API](https://www.wanandroid.com/blog/show/2)接口开发一个基于技术博客APP，
可以查看相关技术博客，并且可以将自己喜欢的文章收藏起来~~~

### 项目主要功能界面
##### 一，首页
[首页1](https://github.com/program008/flutter_app/blob/wanandroid/screens/%E9%A6%96%E9%A1%B501.png?raw=true)

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

+ 在flutter中涉及到异步更新列表数据的时候，可以使用FutureBuilder来封装。

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
+ 左右列表联动主要代码
> Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: YColors.color_fff,
                  child: ListView.builder(
                    itemCount: _datas.length,
                    itemBuilder: (BuildContext context, int position) {
                      return getRow(position);
                    },
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        //height: double.infinity,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(10),
                        color: YColors.color_F9F9F9,
                        child: getChip(
                            buildContext: widget.buildContext,
                            i: index), //传入一级分类下标
                      ),
                    ],
                  )),
            ],
          )
 
 >   Widget getRow(int i) {
    Color textColor = Theme.of(context).primaryColor; //字体颜色
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //Container下的color属性会与decoration下的border属性冲突，所以要用decoration下的color属性
        decoration: BoxDecoration(
          color: index == i ? YColors.color_F9F9F9 : Colors.white,
          border: Border(
            left: BorderSide(
                width: 5,
                color:
                    index == i ? Theme.of(context).primaryColor : Colors.white),
          ),
        ),
        child: Text(
          _datas[i].name,
          style: TextStyle(
            color: index == i ? textColor : YColors.color_666,
            fontWeight: index == i ? FontWeight.w600 : FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
          textColor = YColors.colorPrimary;
        });
      },
    );
  }
  
  
  
  
  > Widget getChip({BuildContext buildContext, int i}) {
    //更新对应下标数据
    _updateArticles(i);
    return Wrap(
      spacing: 10.0, //两个widget之间横向的间隔
      direction: Axis.horizontal, //方向
      alignment: WrapAlignment.start, //内容排序方式
      children: List<Widget>.generate(
        articles.length,
        (int index) {
          return ActionChip(
            //标签文字
            label: Text(
              articles[index].title,
              style: TextStyle(fontSize: 16, color: YColors.color_666),
            ),
            //点击事件
            onPressed: () {
              Navigator.of(buildContext).push(
                MaterialPageRoute(
                  builder: (context) => Browser(
                      title: articles[index].title, url: articles[index].link),
                ),
              );
            },
            elevation: 3,
            backgroundColor: Colors.grey.shade200,
          );
        },
      ).toList(),
    );
  }         
          
          
##### 四，项目
+ 顶部TabBar和主内容TabBarView联动主要代码
>   Widget tabContainer(List<ProjectTitleListData> projectTitles) {
    Widget tabBarContainer = TabBar(
      isScrollable: true,
      unselectedLabelColor: YColors.color_666,
      labelColor: Theme.of(context).primaryColor,
      indicatorColor: Theme.of(context).primaryColor,
      indicatorWeight: 5.0,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      tabs: projectTitles.map((ProjectTitleListData projectTitle) {
        return Tab(
          text: projectTitle.name,
        );
      }).toList(),
      onTap: (index) {
        print("当前选中$index");
      },
    );

    Widget tabContainer = new DefaultTabController(
      length: projectTitles.length ?? 0,
      initialIndex: 0, //初始索引
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.display1.fontSize + 20,
            ),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            color: YColors.color_fff,
            alignment: Alignment.center,
            child: tabBarContainer,
          ),
          Expanded(
            child: TabBarView(
              children: projectTitles.map((ProjectTitleListData projectTitle) {
                return projectListWidget(projectTitle.id); //一个属于展示内容的listview
              }).toList(),
            ),
          ),
        ],
      ),
    );

    return tabContainer;
  }
##### 五，搜索页
##### 六，抽屉页

#### 网络请求中携带cookie
###### 注：不管是请求还是保存，只需要给dio设置interceptors
+ 添加依赖
> dio_cookie_manager: 1.0.0
+ 请求保存cookie
>   var dio = Dio();
    var cookieJar=CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
+ 请求时携带cookie
> Dio dio = Dio();
  var cookieJar=CookieJar();
  dio.interceptors.add(CookieManager(cookieJar));

  

    
 
 


