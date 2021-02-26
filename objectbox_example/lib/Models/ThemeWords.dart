
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_example/Models/Word.dart';

@Entity()
class ThemeWords{
  int id;//должно быть всегда поле id. Сами его мы не задаем

  String name;
  final allWords = ToMany<Word>();

  ThemeWords({this.name});

  // factory ThemeWords.fromJson(Map<String, dynamic> json) {
  //   final nameTheme = json["theme"];

  //   final List<Map<String, dynamic>> jsonListWord = json['allWords'];
  //   final List<Word> words = jsonListWord.map((jsonWord) => Word.fromJson(jsonWord, nameTheme)).toList();

  //   ThemeWords theme = ThemeWords(name: nameTheme);
  //   theme.allWords.addAll(words);

  //   return theme;
  // }
  
}