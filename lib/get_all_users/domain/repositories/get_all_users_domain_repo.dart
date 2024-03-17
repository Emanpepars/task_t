import 'package:dartz/dartz.dart';
import 'package:taskk/core/error/failures.dart';
import 'package:taskk/get_all_users/domain/entities/users_entity.dart';

abstract class GetAllUsersDomainRepo {
  Future<Either<Failures, List<UsersEntity>>>  getAllUsers();
}
