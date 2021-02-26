import 'package:flutter/material.dart';
import 'package:objectbox_example/Content/Prepositions.dart';
import 'package:objectbox_example/Content/ProfessionAndWork.dart';
import 'package:objectbox_example/Content/Subjects.dart';
import 'package:objectbox_example/Content/Time.dart';
import 'package:objectbox_example/Data/DBProvider.dart';
import 'package:objectbox_example/Models/ThemeWords.dart';
import 'package:objectbox_example/Models/Word.dart';

class LoadContent {
  Future getThemes() async {


    final List<Map<String, dynamic>> allContent = [
      Prepositions.allWord,
      ProfessionAndWork.allWord,
      Subjects.allWord,
      Time.allWord
    ];

    List<ThemeWords> themes = [];

    await Future.wait( allContent.map((element) async {
      ThemeWords theme = await _createAndSaveTheme(element);
      themes.add(theme);
    }));

    await DBProvider.db.newThemeList(themes);


    // final Future<List<Theme>> themes = Future.wait( allContent.map((json) async {
    //   final nameTheme = json["theme"];
    //   final jsonListWord = json["allWords"];

    //   ThemeWords theme = ThemeWords(name: nameTheme);

    //   final List<Word> words = jsonListWord
    //       .map((jsonWord) => Word.fromJson(jsonWord, nameTheme))
    //       .toList();

    //   await DBProvider.db.newWordList(words);

    //   theme.allWords.addAll(words);

    //   return theme;
    // }).toList());

    // await DBProvider.db.newThemeList(themes);
  }

  Future<ThemeWords> _createAndSaveTheme(Map<String, dynamic> json) async {
    final nameTheme = json["theme"];
    final jsonListWord = json["allWords"];

    ThemeWords theme = ThemeWords(name: nameTheme);

    final List<Word> words = jsonListWord.map((jsonWord) => Word.fromJson(jsonWord, nameTheme)).toList();

    await DBProvider.db.newWordList(words);

    theme.allWords.addAll(words);

    return theme;
  }


}
