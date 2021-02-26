import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectbox_example/API/LoadContent.dart';
import 'package:objectbox_example/Data/DBProvider.dart';

class ThemeState {
  final bool loadStatus;
  final List<Theme> listThemes;

  ThemeState({this.loadStatus, this.listThemes});

  ThemeState copyWith({bool loadStatus, List<Theme> listThemes}){

    return ThemeState(loadStatus: loadStatus ?? this.loadStatus,
                     listThemes: listThemes ?? this.listThemes);

  }
  
}


class ThemeCubit extends Cubit<ThemeState>{
  
  LoadContent _userProvider = LoadContent();
  List<Theme> _listThemes = [];
  final DBProvider cash = DBProvider.db;

  final ThemeState userState;
  ThemeCubit(this.userState) : super(ThemeState());

  Future<void> fetchUser() async {
    //показываем в начале пустой экран
    emit(userState.copyWith(listThemes: _listThemes, loadStatus: true));

    //грузим юзеров из памяти
    _listThemes = await cash.getAllThemes();
    emit(userState.copyWith(listThemes: _listThemes, loadStatus: true));

    try {
      // загружаем юзеров и показываем уже из памяти

      await _userProvider.getUser();

      _listThemes = await cash.getAllThemes();
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));

    } catch(_) {
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));
    }
  }

  Future<void> reloadUser() async {
    try {
      await _userProvider.getUser();
      _listThemes = await cash.getAllThemes();
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));
    } catch(_) {
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));
    }
  }


}


