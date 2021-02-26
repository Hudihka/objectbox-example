
import 'package:objectbox/objectbox.dart';
import 'dart:io';

@Entity()
class Word{
  int id;//должно быть всегда поле id. Сами его мы не задаем

  String engValue;
  String rusValue;
  String descript;
  String theme;
  bool favorit;

  Word({this.engValue, this.rusValue, this.descript, this.theme});

  factory Word.fromJson(Map<String, dynamic> json, String theme) {
    
    return Word(engValue: json['engValue'],
                rusValue: json['rusValue'],
                descript: json['descript'],
                theme: theme);
  }

}
