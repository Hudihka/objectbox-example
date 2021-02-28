import 'package:objectbox_example/Content/Prepositions.dart';
import 'package:objectbox_example/Content/ProfessionAndWork.dart';
import 'package:objectbox_example/Content/Subjects.dart';
import 'package:objectbox_example/Content/Time.dart';

class AllContent {
  final List<Map<String, dynamic>> allContent = [
    Prepositions.allWord,
    ProfessionAndWork.allWord,
    Subjects.allWord,
    Time.allWord
  ];
}
