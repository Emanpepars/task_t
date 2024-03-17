import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk/get_all_users/data/repositories/get_all_users_data_repo.dart';
import 'package:taskk/get_all_users/domain/entities/users_entity.dart';
import 'package:taskk/get_all_users/domain/repositories/get_all_users_domain_repo.dart';
import 'package:taskk/get_all_users/domain/use_cases/all_users_use_case.dart';
import 'package:taskk/get_all_users/presentation/manager/get_all_users_states.dart';

import '../../data/data_sources/get_all_users_dto.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersStates> {
  GetAllUsersDto sources;

  GetAllUsersCubit(this.sources) : super(GetAllUsersInitState());

  static GetAllUsersCubit get(context) => BlocProvider.of(context);

  List<UsersEntity> users = [];

  getAllUsers() async {
    GetAllUsersDomainRepo getAllUsersDomainRepo = GetAllUsersDataRepo(sources);
    GetAllUsersUseCase getAllUsersUseCase =
        GetAllUsersUseCase(getAllUsersDomainRepo);
    var result = await getAllUsersUseCase.call();
    result.fold((l) => emit(GetAllUsersErrorState(l)), (r) {
      users = r;
      emit(GetAllUsersSuccessState(r));
    });
  }

  removeUser(value) {
    users.removeWhere((element) => element.id == value);
    emit(GetRemoveUserState());
  }
}
