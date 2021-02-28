
import 'package:hive/hive.dart';
part 'Word.g.dart';

@HiveType(typeId: 1)
class Word extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String engValue;

  @HiveField(2)
  String rusValue;

  @HiveField(3)
  String descript;

  @HiveField(4)
  String theme;

  @HiveField(5)
  bool favorit;

  Word({this.id, this.engValue, this.rusValue, this.descript, this.theme});

  factory Word.fromJson(Map<String, dynamic> json, String theme) {

    final String eng = json['engValue'];
    final String rus = json['rusValue'];
    final String des = json['descript'];

    final String id = '${theme}_${eng}_${rus}_$des';

    return Word(id: id,
                engValue: eng,
                rusValue: rus,
                descript: des,
                theme: theme);
  }

  static List<Word> fromListOfMap(List<dynamic> data, String theme) {
    List<Word> wordLists = List<Word>();
    
    data.forEach((element) {
      wordLists.add(Word.fromJson(element, theme));
    });

    return wordLists;
  }

}


// import 'package:objectbox/objectbox.dart';
// import 'dart:io';

// @Entity()
// class Word{
//   int id;//должно быть всегда поле id. Сами его мы не задаем

//   String engValue;
//   String rusValue;
//   String descript;
//   String theme;
//   bool favorit;

//   Word({this.engValue, this.rusValue, this.descript, this.theme});

//   factory Word.fromJson(Map<String, dynamic> json, String theme) {
    
//     return Word(engValue: json['engValue'],
//                 rusValue: json['rusValue'],
//                 descript: json['descript'],
//                 theme: theme);
//   }

// }
