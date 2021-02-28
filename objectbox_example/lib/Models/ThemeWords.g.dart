// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ThemeWords.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeWordsAdapter extends TypeAdapter<ThemeWords> {
  @override
  final int typeId = 0;

  @override
  ThemeWords read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeWords(
      name: fields[0] as String,
      listWord: (fields[1] as List)?.cast<Word>(),
    );
  }

  @override
  void write(BinaryWriter writer, ThemeWords obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.listWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeWordsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
