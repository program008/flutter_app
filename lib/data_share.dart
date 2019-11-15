import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  void _incrementCounter() => setState(() {count++;});// 修改计数器

  @override
  Widget build(BuildContext context) {
    return CountContainer(
        model: this,// 将自身作为 model 交给 CountContainer
        increment: _incrementCounter,// 提供修改数据的方法
        child:Counter()
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取 InheritedWidget 节点
    CountContainer state = CountContainer.of(context);
    return Scaffold(
    appBar: AppBar(title: Text("wight间数据共享"),),
    body: Text(
    'You have pushed the button this many times: ${state.model.count}', // 关联数据读方法
    ),
    floatingActionButton: FloatingActionButton(onPressed: state.increment), // 关联数据修改方法
    );
  }
}

class CountContainer extends InheritedWidget {
  // 方便其子 Widget 在 Widget 树中找到它...
  static CountContainer of(BuildContext context) => context.inheritFromWidgetOfExactType(CountContainer) as CountContainer;
  final _MyHomePageState model;// 直接使用 MyHomePage 中的 State 获取数据
  final Function() increment;

  CountContainer({
  Key key,
  @required this.model,
  @required this.increment,
  @required Widget child,
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return null;
  }
}

