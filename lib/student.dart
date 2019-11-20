//  {
//    "id":"123",
//    "name":" ���� ",
//    "score" : 95,
//    "teachers": [
//       {
//         "name": " ���� ",
//         "age" : 40
//       },
//       {
//         "name": " ���� ",
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

///����������Ϊֹ�����ǵ� JSON ���ݽ�����������Isolate����ɣ����JSON�����ݸ�ʽ���Ƚϸ��ӣ��������ִ�
///���ֽ�����ʽ���ܻ��ճɶ���UI�޷���Ӧ����Ӧ����CPU�ܼ��͵Ĳ���,
///���ǿ���ʹ��compute�����������������ŵ�Isolate�����
///

Student parseStudent(String content) {
  final jsonResponse = json.decode(content);
  Student student = Student.fromJson(jsonResponse);
  return student;
}

doSth() {
  // �� compute ������ json �����ŵ��� Isolate
  compute(parseStudent, "jsonString")
      .then((student) => print(student.teachers));
}
