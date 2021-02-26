
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_example/Models/Word.dart';

@Entity()
class Theme{
  int id;//должно быть всегда поле id. Сами его мы не задаем

  String name;
  final allWords = ToMany<Word>();
  
}