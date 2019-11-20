//  {
//    "id":"123",
//    "name":" 张三 ",
//    "score" : 95,
//    "teachers": [
//       {
//         "name": " 李四 ",
//         "age" : 40
//       },
//       {
//         "name": " 王五 ",
//         "age" : 45
//       }
//    ]
//  }

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Student {
  String id;
  String name;
  int score;
  List<Teacher> teachers;

  Student({this.name, this.id, this.score, this.teachers});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        id: parsedJson['id'],
        name: parsedJson['name'],
        score: parsedJson['score'],
        teachers: getTeachers(parsedJson['teachers']));
  }

  static List<Teacher> getTeachers(dynamic list) {
    List<Teacher> teachers = List();
    list.forEach((f) {
      teachers.add(Teacher.fromJson(f));
    });
    return teachers;
  }
}

class Teacher {
  String name;
  int age;

  Teacher({this.name, this.age});

  factory Teacher.fromJson(Map<String, dynamic> parsedJson) {
    return Teacher(name: parsedJson['name'], age: parsedJson['age']);
  }
}

///不过到现在为止，我们的 JSON 数据解析还是在主Isolate中完成，如果JSON的数据格式化比较复杂，数据量又大
///这种解析方式可能会照成短期UI无法响应，对应这类CPU密集型的操作,
///我们可以使用compute函数，将解析工作放到Isolate中完成
///

Student parseStudent(String content) {
  final jsonResponse = json.decode(content);
  Student student = Student.fromJson(jsonResponse);
  return student;
}

doSth() {
  // 用 compute 函数将 json 解析放到新 Isolate
  compute(parseStudent, "jsonString")
      .then((student) => print(student.teachers));
}
