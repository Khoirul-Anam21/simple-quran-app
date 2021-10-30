// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../ayat/text.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextAdapter extends TypeAdapter<Text> {
  @override
  final int typeId = 9;

  @override
  Text read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Text(
      arab: fields[0] as String?,
      transliteration: fields[1] as AyatTransliteration?,
    );
  }

  @override
  void write(BinaryWriter writer, Text obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.arab)
      ..writeByte(1)
      ..write(obj.transliteration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
