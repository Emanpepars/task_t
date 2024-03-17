import 'package:flutter/material.dart';
import 'package:taskk/get_all_users/domain/entities/users_entity.dart';
import 'package:taskk/get_all_users/presentation/pages/get_all_users_screen.dart';

import '../get_all_users/presentation/pages/user_details_screen.dart';

class Routes {
  static const String userDetails = 'userDetails';
  static const String allUserScreen = '/';
}

class AppRoutes {
  static onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.allUserScreen:
        return MaterialPageRoute(
          builder: (context) => const GetAllUsersScreen(),
        );
      case Routes.userDetails:
        UsersEntity userEntity = routeSettings.arguments as UsersEntity;
        return MaterialPageRoute(
          builder: (context) => UserDetailsScreen(
            usersEntity: userEntity,
          ),
        );
    }
  }
}
