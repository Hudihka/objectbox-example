import 'dart:io';
import 'package:objectbox_example/Models/ThemeWords.dart';
import 'package:path_provider/path_provider.dart';
import '../objectbox.g.dart';


class DBProvider {

  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Store _store;
  // Box<User> _boxUser;

  Future<Store> get _dataBase async {
    if (_store != null) {
      return _store;
    }

    // если _database имеет значение null, мы создаем его экземпляр
    await initDB();
    return _store;
  }

  Future<Store> initDB() async {
    
    await getApplicationDocumentsDirectory().then((Directory dir) async {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
    });
  }

  clear() {
    _store.close();
  }

  // newUsersList(List<User> users) async {
  //   final db = await _dataBase;
  //   final boxUser = db.box<User>();

  //   List<int> ids = boxUser.putMany(users);
  //   boxUser.getMany(ids);
  // }

  // Future<List<User>> getAllUsers() async {
  //   final db = await _dataBase;
  //   final boxUser = db.box<User>();

  //   final List<User> listUsers = boxUser.getAll();
  //   return (listUsers == Null) ? [] : listUsers;
  // }

  newThemeList(List<ThemeWords> themes) async {
    final db = await _dataBase;
    final boxThemes = db.box<ThemeWords>();

    List<int> ids = boxThemes.putMany(themes);
    boxThemes.getMany(ids);
  }

  Future<List<ThemeWords>> getAllThemes() async {
    final db = await _dataBase;
    final boxTheme = db.box<ThemeWords>();

    final List<ThemeWords> listThemes = boxTheme.getAll();
    return (listThemes == Null) ? [] : listThemes;
  }
  
  // newWordList(List<Word> words) async {
  //   final db = await _dataBase;
  //   final boxWord = db.box<Word>();

  //   List<int> ids = boxWord.putMany(words);
  //   boxWord.getMany(ids);
  // }

  // newTheme(Theme theme, List<Word> words) async {
  //   final db = await _dataBase;
  //   final boxTheme = db.box<Theme>();

  //   final ids = boxTheme.put(theme);
    
  //   // boxWord.getMany(ids);
  // }


}
