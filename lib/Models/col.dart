import 'package:flutter/foundation.dart';

class Col {
  String test;
  DateTime created_at;
  String samople;
  String category;
  String id;

  Col({this.test, this.samople, this.category, this.created_at, this.id});

  Col.fromMap(Map<String, dynamic> data, String id) {
    this.test = data[UserField.test];

    this.samople = data[UserField.samople];
    this.category = data[UserField.category];
    this.id = id;
  }
  // Map<String, dynamic> toMap() {
  //   return {
  //     UserField.test: this.test,
  //     UserField.samople: this.samople,
  //     UserField.created_at: this.created_at, // Dateはそのまま渡せる
  //   };
  // }
  Map<String, dynamic> ttMap() {
    return {
      'test': test,
      'samople': samople,
      'category': category,
      'created_at': DateTime.now(),
    };
  }
}

class UserField {
  static const id = "id";
  static const test = "test";
  static const samople = "samople";
  static const category = "category";
  static const created_at = "created_at";
}
