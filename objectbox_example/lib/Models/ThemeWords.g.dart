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
      id: fields[0] as String,
      name: fields[1] as String,
      listWord: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeWords obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
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
