import 'package:taskk/core/error/failures.dart';
import 'package:taskk/get_all_users/domain/entities/users_entity.dart';

abstract class GetAllUsersStates {}

class GetAllUsersInitState extends GetAllUsersStates {}
class GetRemoveUserState extends GetAllUsersStates {}

class GetAllUsersSuccessState extends GetAllUsersStates {
  List<UsersEntity> users;

  GetAllUsersSuccessState(this.users);
}

class GetAllUsersErrorState extends GetAllUsersStates {
  Failures failures;

  GetAllUsersErrorState(this.failures);
}
