import 'package:flutter/material.dart';

class KnowledgeWidget extends StatefulWidget {
  @override
  _KnowledgeState createState() => _KnowledgeState();
}

class _KnowledgeState extends State<KnowledgeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: Center(
          child: Text("知识体系"),
        ),
      ),
    );
  }
}
