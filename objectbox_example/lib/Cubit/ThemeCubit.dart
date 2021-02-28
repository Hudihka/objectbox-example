
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectbox_example/API/LoadContent.dart';
import 'package:objectbox_example/Data/DBProvider.dart';
import 'package:objectbox_example/Models/ThemeWords.dart';

class ThemeState {

  final bool loadStatus;
  final List<ThemeWords> listThemes;

  ThemeState({this.loadStatus, this.listThemes});

  ThemeState copyWith({bool loadStatus, List<ThemeWords> listThemes}){

    return ThemeState(loadStatus: loadStatus ?? this.loadStatus,
                     listThemes: listThemes ?? this.listThemes);

  }
  
}


class ThemeCubit extends Cubit<ThemeState>{
  
  LoadContent _themeProvider = LoadContent();
  List<ThemeWords> _listThemes = [];
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

      await _themeProvider.getThemes();

      _listThemes = await cash.getAllThemes();
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));

    } catch(_) {
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));
    }
  }

  Future<void> reloadUser() async {
    try {
      await _themeProvider.getThemes();
      _listThemes = await cash.getAllThemes();
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));
    } catch(_) {
      emit(userState.copyWith(listThemes: _listThemes, loadStatus: false));
    }
  }


}


