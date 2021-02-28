
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/ThemeCubit.dart';
import 'UserList.dart';

class HomePage extends StatelessWidget {
  final usersState = ThemeState();

  

  @override
  Widget build(BuildContext context) {
    // DBProvider.db.initDB();

    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(usersState),
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