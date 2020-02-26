class Col {
  String test;
  DateTime created_at;
  String samople;
  String id;

  Col({this.test, this.samople, this.created_at, this.id});

  Col.fromMap(Map<String, dynamic> data, String id) {
    this.test = data[UserField.test];
    this.samople = data[UserField.samople];
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
      'created_at': DateTime.now(),
    };
  }
}

class UserField {
  static const id = "id";
  static const test = "test";
  static const samople = "samople";
  static const created_at = "created_at";
}
