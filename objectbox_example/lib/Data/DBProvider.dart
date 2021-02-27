import 'dart:io';
import 'package:objectbox_example/Models/User.dart';
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

   newUsersList(List<User> users) async {
    final db = await _dataBase;
    final boxUser = db.box<User>();

    User user = users.first;
    int userID = user.idBack;

    final query = boxUser.query(User_.id.equals(userID)).build();
    
    if (query.find().isEmpty) {
      boxUser.put(user);
      // boxUser.get(id);
    }




    // final id = boxUser.put(user);
    // boxUser.get(id);

    // List<int> ids = boxUser.putMany(users);
    // boxUser.getMany(ids);

  }

  Future<List<User>> getAllUsers() async {
    final db = await _dataBase;
    final boxUser = db.box<User>();

    final List<User> listUsers = boxUser.getAll();
    return (listUsers == Null) ? [] : listUsers;
  }



}


/*
class DBProvider {
  /*
  Создайте частный конструктор, который 
  можно использовать только внутри класса:
  */
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    // если _database имеет значение null, мы создаем его экземпляр
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db"); //имя базы данных
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User (" //модель клиент и ее поля
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "phone TEXT,"
          "email TEXT"
          ")");
    });
  }

  // newUser(User newUser) async {
  //   final db = await database;
  //   var res = await db.insert("User", newUser.toMap);
  //   return res;
  // }

  // newUsers(List<User> newUsers) async {
  //   final db = await database;
  //   newUsers.forEach((element) async {
  //     await db.insert("User", element.toMap);
  //   });
  // }


  Future<void> newUsersList(List<User> users) async {

    final db = await database;
    await Future.wait(

      users.map((element) async {
      final id = element.id;
      final users = await db.query("User", where: "id = ?", whereArgs: [id]);
      final jsonUser = element.toMap;

      //если такого клиента нет, то создаем нового
      if (users.isEmpty){
        await db.insert("User", jsonUser);
      } else {
        await db.update("User", jsonUser, where: "id = ?", whereArgs: [id]);
      }

    }));

    ///ДОБАВИТЬ УДАЛЕНИЕ ТОГО, ЧТО НЕ ПРИШЛО

  }

  //использование самого большого id для нового клиента
  // newUser3(User newUser) async {
  //   final db = await database;
  //   //get the biggest id in the table
  //   var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM User");
  //   int id = table.first["id"];
  //   //insert to the table using the new id
  //   var raw = await db.rawInsert(
  //       "INSERT Into User (id,first_name,last_name,blocked)"
  //       " VALUES (?,?,?,?)",
  //       [id, newUser.name, newUser.lastName, newUser.blocked]);
  //   return raw;
  // }

  //получение клиента по id
  getUser(int id) async {
    final db = await database;
    var res = await db.query("User", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromJson(res.first) : Null;
  }

  //получение всех клиентов

  Future<List<User>> getAllUsers() async {
    final db = await database;
    var res = await db.query("User");
    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
    return list;
  }

  //получение только заблокированных клиентов

  // getBlockedUsers() async {
  //   final db = await database;
  //   var res = await db.rawQuery("SELECT * FROM User WHERE blocked=1");
  //   List<User> list =
  //       res.isNotEmpty ? res.toList().map((c) => User.fromJson(c)) : null;
  //   return list;
  // }

  //Обновить существующего юзера

  updateUser(User newUser) async {
    final db = await database;
    var res = await db.update("User", newUser.toMap,
        where: "id = ?", whereArgs: [newUser.id]);
    return res;
  }

  //удалить юзера

  deleteUser(int id) async {
    final db = await database;
    db.delete("User", where: "id = ?", whereArgs: [id]);
  }

  //удалить всех юзеров

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from User");
  }
}

*/