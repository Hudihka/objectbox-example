

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

    // for (var i = 0; i < allContent.length; i++) {
    //   Map<String, dynamic> json = allContent[i];
    //   ThemeWords theme = await _createAndSaveTheme(json);
    //   themes.add(theme);
    // }

    await DBProvider.db.newThemeList(themes);

  }

  // Future<ThemeWords> _createAndSaveTheme(Map<String, dynamic> json) async {
  //   final nameTheme = json["theme"];
  //   final jsonListWord = json["allWords"];

  //   ThemeWords theme = ThemeWords(name: nameTheme);

  //   List<Word> words = [];
  //   await Future.forEach(jsonListWord, (jsonWord) async {
  //     final word = Word.fromJson(jsonWord, nameTheme);
  //     words.add(word);
  //   });


  //   // так не работает ХЗ почему
  //   // List<Word> words1 = [];
  //   // jsonListWord.map( (jsonWord) => Word.fromJson(jsonWord, nameTheme) ).toList();
  //   // print(words1);


  //   await DBProvider.db.newWordList(words);

  //   theme.allWords.addAll(words);

  //   return theme;
  // }


}