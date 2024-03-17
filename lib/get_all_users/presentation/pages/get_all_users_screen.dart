import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskk/get_all_users/presentation/manager/get_all_users_cubit.dart';
import 'package:taskk/get_all_users/presentation/manager/get_all_users_states.dart';

import '../../../config/routes.dart';

class GetAllUsersScreen extends StatelessWidget {
  const GetAllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllUsersCubit, GetAllUsersStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ListView.builder(
            itemCount: GetAllUsersCubit.get(context).users.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Slidable(
                key: const ValueKey(0),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        GetAllUsersCubit.get(context).removeUser(
                            GetAllUsersCubit.get(context).users[index].id);
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.userDetails,
                        arguments: GetAllUsersCubit.get(context).users[index]);
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    elevation: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Id: ",
                              ),
                              Text(
                                  "${GetAllUsersCubit.get(context).users[index].id}"),
                            ],
                          ),
                          Row(
                            children: [
                              const Text("name: "),
                              Text(GetAllUsersCubit.get(context)
                                  .users[index]
                                  .name),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
