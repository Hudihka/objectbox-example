
import 'package:hive/hive.dart';
import 'package:objectbox_example/Extension/String.dart';
import 'Word.dart';
part 'ThemeWords.g.dart';

@HiveType(typeId: 0)
class ThemeWords extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final List<Word> listWord;

  ThemeWords({this.id, this.name, this.listWord});

  factory ThemeWords.fromJson(Map<String, dynamic> json) {
    String name = json['theme'];
    String id = name.generateMd5;
    List<dynamic> data = json['allWords'];

    List<Word> listWord = Word.fromListOfMap(data, name);

    return ThemeWords(id: id,
                      name: name,
                      listWord: listWord);
  }

}


