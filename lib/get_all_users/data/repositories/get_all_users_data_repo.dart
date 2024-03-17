import 'package:dartz/dartz.dart';
import 'package:taskk/core/error/failures.dart';
import 'package:taskk/get_all_users/data/data_sources/get_all_users_dto.dart';
import 'package:taskk/get_all_users/domain/entities/users_entity.dart';
import 'package:taskk/get_all_users/domain/repositories/get_all_users_domain_repo.dart';

import '../models/users_model.dart';

class GetAllUsersDataRepo implements GetAllUsersDomainRepo {
  GetAllUsersDto getAllUsersDto;

  GetAllUsersDataRepo(this.getAllUsersDto);

  @override
  Future<Either<Failures, List<UsersEntity>>> getAllUsers() =>
      getAllUsersDto.getAllUsers();
}
