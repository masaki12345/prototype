class Col {
  String test;
  DateTime created_at;
  String samople;
  String category;
  String id;
  String category_color;
  String category_name;

  Col(
      {this.test,
      this.samople,
      this.category,
      this.created_at,
      this.id,
      this.category_color,
      this.category_name});

  Col.fromMap(Map<String, dynamic> data, String id) {
    this.test = data[UserField.test];
    this.samople = data[UserField.samople];
    this.category = data[UserField.category];
    this.id = id;
  }

  Col.cateMap(Map<String, dynamic> data, String id) {
    this.category_color = data[UserField.category_color];
    this.category_name = data[UserField.category_name];
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

  Map<String, dynamic> ccMap() {
    return {
      'category_color': category_color,
      'category_name': category_name,
      'created_at': DateTime.now(),
    };
  }
}

class UserField {
  static const id = "id";
  static const test = "test";
  static const samople = "samople";
  static const category = "category";
  static const category_color = "category_color";
  static const category_name = "category_name";
  static const created_at = "created_at";
}
