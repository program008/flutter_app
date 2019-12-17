import 'package:flutter/material.dart';
import 'package:flutter_app/provider/screens.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(
    MultiProvider(providers: [
      Provider<int>(
        create: (_) => textSize,
      ),
      ChangeNotifierProvider<CounterModel>.value(value: counter),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FirstScreen(),
    );
  }
}