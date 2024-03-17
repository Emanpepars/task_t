import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  const UsersEntity({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.age,
    required this.gender,
    required this.password,
  });

  final int id;
  final String name;
  final DateTime birthDate;
  final int age;
  final int gender;
  final String password;

  @override
  List<Object?> get props => [id, name, birthDate, age, gender, password];
}
