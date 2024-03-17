import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:taskk/core/api/end_points.dart';
import 'package:taskk/core/error/failures.dart';
import 'package:taskk/core/utils/app_const.dart';
import 'package:taskk/get_all_users/data/data_sources/get_all_users_dto.dart';
import 'package:taskk/get_all_users/data/models/users_model.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/users_entity.dart';

class GetAllUsersRemoteDto extends GetAllUsersDto {
  List<UsersEntity> users = [];

  @override
  Future<Either<Failures, List<UsersEntity>>> getAllUsers() async {
    try {
      var response = await http
          .get(Uri.parse('${AppConsts.baseUrl}${EndPoints.getAllUser}'));

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        users = responseData.map((data) => UsersModel.fromJson(data)).toList();
        return Right(users);
      } else {
        return Left(ServerFailures('Failed to load users'));
      }
    } catch (e) {
      return Left(ServerFailures('Failed to load users'));
    }
  }
}
