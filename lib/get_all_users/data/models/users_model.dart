import 'package:taskk/get_all_users/domain/entities/users_entity.dart';

class UsersModel extends UsersEntity {
  const UsersModel({
    required super.id,
    required super.name,
    required super.birthDate,
    required super.age,
    required super.gender,
    required super.password,
  });

  UsersModel.fromJson(dynamic json)
      : this(
          id: json['id'],
          name: json['name'],
          birthDate: DateTime.parse(json['birthDate']),
          age: json['age'],
          gender: json['gender'],
          password: json['password'],
        );

  static List<UsersModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UsersModel.fromJson(json)).toList();
  }
}
