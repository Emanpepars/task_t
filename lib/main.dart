import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk/config/routes.dart';
import 'package:taskk/get_all_users/data/data_sources/get_all_users_remote_dto.dart';
import 'package:taskk/get_all_users/presentation/manager/get_all_users_cubit.dart';

import 'my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(BlocProvider(
      create: (context) => GetAllUsersCubit(
            GetAllUsersRemoteDto(),
          )..getAllUsers(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings routeSettings) =>
          AppRoutes.onGenerate(routeSettings),
    );
  }
}
