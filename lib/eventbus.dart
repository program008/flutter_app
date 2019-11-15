// 建立公共的 event bus
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

EventBus eventBus = new EventBus();

// 第一个页面
class _FirstScreenState extends State<FirstScreen> {
  String msg = " 通知：";
  var subscription;

  @override
  initState() {
    // 监听 CustomEvent 事件，刷新 UI
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        msg += event.msg;
      }); // 更新 msg
    });
    super.initState();
  }

  dispose() {
    subscription.cancel(); //State 销毁时，清理注册
    super.dispose();
  }

  void _to() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SecondScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text(msg),
      floatingActionButton: FloatingActionButton(
        onPressed: _to,
        child: Icon(Icons.send),
      ),
    );
  }
}

class CustomEvent {
  String msg;

  CustomEvent(this.msg);
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: RaisedButton(
          child: Text('Fire Event'),
          // 触发 CustomEvent 事件
          onPressed: () => eventBus.fire(CustomEvent("hello"))),
    );
  }
}
