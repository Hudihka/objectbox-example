
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/UserCubit.dart';
import 'UserList.dart';

class HomePage extends StatelessWidget {
  final usersState = UserState();

  @override
  Widget build(BuildContext context) {

    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersState),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('TestApplication'),
          centerTitle: true,
        ),
        body: UserList(),
      ),
    );
  }
}