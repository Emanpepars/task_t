import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk/get_all_users/presentation/manager/get_all_users_cubit.dart';
import 'package:taskk/get_all_users/presentation/manager/get_all_users_states.dart';

import '../../domain/entities/users_entity.dart';

class UserDetailsScreen extends StatelessWidget {
  final UsersEntity usersEntity;

  const UserDetailsScreen({required this.usersEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllUsersCubit, GetAllUsersStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Id: "),
                  Text("${usersEntity.id}"),
                ],
              ),
              Row(
                children: [
                  const Text("name: "),
                  Text(usersEntity.name),
                ],
              ),
              Row(
                children: [
                  const Text("birthDate: "),
                  Text("${usersEntity.birthDate}"),
                ],
              ),
              Row(
                children: [
                  const Text("age: "),
                  Text("${usersEntity.age}"),
                ],
              ),
              Row(
                children: [
                  const Text("gender: "),
                  Text("${usersEntity.gender}"),
                ],
              ),
              Row(
                children: [
                  const Text("password: "),
                  Text(usersEntity.password),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: 100,
          child: FloatingActionButton(
            onPressed: () {
              GetAllUsersCubit.get(context).removeUser(usersEntity.id);
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Remove'),
            ),
          ),
        ),
      ),
    );
  }
}
