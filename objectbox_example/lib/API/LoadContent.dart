

import 'package:objectbox_example/Content/Prepositions.dart';
import 'package:objectbox_example/Content/ProfessionAndWork.dart';
import 'package:objectbox_example/Content/Subjects.dart';
import 'package:objectbox_example/Content/Time.dart';
import 'package:objectbox_example/Data/DBProvider.dart';
import 'package:objectbox_example/Models/Theme.dart';

class LoadContent {

  Future getUser() async {

    final List<Map<String, dynamic>> allContent = [Prepositions.allWord, ProfessionAndWork.allWord,
                                                   Subjects.allWord, Time.allWord];

    final List<Theme> themes = allContent.map((json) => Theme.fromJson(json)).toList();
    await DBProvider.db.newThemeList(themes);

  }

    
}