class UserModel {
  String id;
  final String name;
  final int age;
  final int height;

  UserModel({
    this.id = '',
    required this.name,
    required this.age,
    required this.height,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'height': height,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        height: json['height'],
      );
}
