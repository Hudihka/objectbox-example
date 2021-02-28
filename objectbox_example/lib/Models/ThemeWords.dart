
import 'package:hive/hive.dart';
// import 'Word.dart';
part 'ThemeWords.g.dart';

@HiveType(typeId: 0)
class ThemeWords extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int listWord;
  // final List<Word> listWord;

  ThemeWords({this.name, this.listWord});

  factory ThemeWords.fromJson(Map<String, dynamic> json) {
    String theme = json['theme'];
    List<dynamic> data = json['allWords'];

    // List<Word> listWord = [];//Word.fromListOfMap(data, theme);

    return ThemeWords(name: theme,
                      listWord: data.length);
  }

}


