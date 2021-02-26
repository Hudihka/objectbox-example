
import 'package:http/http.dart' as http;
import 'package:objectbox_example/Content/Prepositions.dart';
import 'package:objectbox_example/Content/ProfessionAndWork.dart';
import 'package:objectbox_example/Content/Subjects.dart';
import 'package:objectbox_example/Content/Time.dart';
import 'package:objectbox_example/Data/DBProvider.dart';
import 'dart:convert';
import 'package:objectbox_example/Models/User.dart';

class LoadContent {


  Future getUser() async {


    final List<Map<String, dynamic>> allContent = [Prepositions.allWord, ProfessionAndWork.allWord,
                                                   Subjects.allWord, Time.allWord];

    if (response.statusCode == 200){
      final List<dynamic> userJson = json.decode(response.body);
      final List<User> clients = userJson.map((json) => User.fromJson(json)).toList();

      await DBProvider.db.newUsersList(clients);
    } else {
      throw Exception('---------ERROR---------');
    }

  }

    
}