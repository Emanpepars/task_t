import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../domain/entities/users_entity.dart';

abstract class GetAllUsersDto {
  Future<Either<Failures, List<UsersEntity>>>  getAllUsers();
}
