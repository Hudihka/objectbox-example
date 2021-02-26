
import 'package:http/http.dart' as http;
import 'package:objectbox_example/Data/DBProvider.dart';
import 'dart:convert';
import 'package:objectbox_example/Models/User.dart';

class UserProvider {
  // Future значит обещание, 
  // Future <>

  Future getUser() async {
  //final значет не будет изменен другими классами
  //await применяем при async работе
    final response = await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200){
      final List<dynamic> userJson = json.decode(response.body);
      List<User> clients = userJson.map((json) => User.fromJson(json)).toList();

      await DBProvider.db.newUsersList(clients);
    } else {
      throw Exception('---------ERROR---------');
    }

  }

    
}