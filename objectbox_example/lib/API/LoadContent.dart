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

    List<ThemeWords> themes = await Future.wait( allContent.map((element) => _createAndSaveTheme(element) ).toList());

    await DBProvider.db.newThemeList(themes);

  }

  Future<ThemeWords> _createAndSaveTheme(Map<String, dynamic> json) async {
    final nameTheme = json["theme"];
    final jsonListWord = json["allWords"];

    print("---------00");
    ThemeWords theme = ThemeWords(name: nameTheme);
    print("---------11");

    

    final List<Word> words = await Future.wait( jsonListWord.map((jsonWord) => Word.fromJson(jsonWord, nameTheme)).toList());

    print("---------22");
    await DBProvider.db.newWordList(words);

    theme.allWords.addAll(words);

    return theme;
  }


}
