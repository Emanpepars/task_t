import 'package:dartz/dartz.dart';
import 'package:taskk/core/error/failures.dart';
import 'package:taskk/get_all_users/domain/entities/users_entity.dart';
import 'package:taskk/get_all_users/domain/repositories/get_all_users_domain_repo.dart';

class GetAllUsersUseCase {
  GetAllUsersDomainRepo getAllUsersDomainRepo;

  GetAllUsersUseCase(this.getAllUsersDomainRepo);

  Future<Either<Failures, List<UsersEntity>>>  call() =>
      getAllUsersDomainRepo.getAllUsers();
}
