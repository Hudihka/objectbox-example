import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/ThemeCubit.dart';
import 'Models/User.dart';



class UserList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //говорит о том, что грузим юзеров при запуске
    final UserCubit userCubit = context.read();
    userCubit.fetchUser();

    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserState){
        List<User> _dataArray = state.listUsers;
        bool _loadStatus = state.loadStatus;

        if (_dataArray.isEmpty)  {
          return Center(child: _loadStatus ? CircularProgressIndicator() : 
                                             Text('На бэке пусто', style: TextStyle(fontSize: 20)
                  ));
        } else {

          return RefreshIndicator(
            child: ListView.builder(
                itemCount: _dataArray.length,
                itemBuilder: (context, index) {
                  User obj = _dataArray[index];
                  return _cellForIndex(obj);
                }),
            onRefresh: (){
              return _refresh(context, _loadStatus);
            },
          );
        }
      }

    });
  }

  Widget _cellForIndex(User obj) {
    //ячейка по индексу

    return Ink(
      color: Colors.grey[50], //выделение ячейки
      child: ListTile(
        subtitle: Text(obj.name),
        title: Text(obj.name),
        leading: CircleAvatar(
          child: Text(obj.id.toString()),
        ),
        trailing: Text(obj.email),
        onTap: () {
          print('---------${obj.name} - ${obj.phone}----------------');
        },
      ),
    );
  }

  Future<void> _refresh(BuildContext context, bool loadStatus) async {
    if (loadStatus == false) {
      //идем в верх по дереву виджетов пока не дойдем до блока
      final UserCubit userCubit = context.read();
      userCubit.reloadUser();
    }
  }

}

