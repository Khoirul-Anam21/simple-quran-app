// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../ayat/ayat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VerseAdapter extends TypeAdapter<Verse> {
  @override
  final int typeId = 5;

  @override
  Verse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Verse(
      number: fields[0] as Number?,
      meta: fields[1] as AyatInfo?,
      text: fields[2] as Text?,
      translation: fields[3] as Translation?,
      audio: fields[4] as Audio?,
    );
  }

  @override
  void write(BinaryWriter writer, Verse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.meta)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.translation)
      ..writeByte(4)
      ..write(obj.audio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VerseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
