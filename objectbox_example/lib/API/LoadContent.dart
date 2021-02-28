

import 'package:objectbox_example/Content/ALLCONTENT.dart';
import 'package:objectbox_example/Data/DBProvider.dart';
import 'package:objectbox_example/Models/ThemeWords.dart';
import 'package:objectbox_example/Models/Word.dart';


class LoadContent {
  Future getThemes() async {

    final List<Map<String, dynamic>> allContent = AllContent.allContent;

    List<ThemeWords> themes = [];
    await Future.forEach(allContent, (jsonThemes) async {
      final theme = ThemeWords.fromJson(jsonThemes);
      themes.add(theme);
    });

    await DBProvider.db.newThemeList(themes);

  }

}