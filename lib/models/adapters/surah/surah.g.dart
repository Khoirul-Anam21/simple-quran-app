// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../surah/surah.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahAdapter extends TypeAdapter<Surah> {
  @override
  final int typeId = 2;

  @override
  Surah read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Surah(
      number: fields[0] as int?,
      sequence: fields[1] as int?,
      numberOfVerses: fields[2] as int?,
      name: fields[3] as Name?,
      revelation: fields[4] as Revelation?,
      preBismillah: fields[5],

    );
  }

  @override
  void write(BinaryWriter writer, Surah obj) {
    writer..writeByte(6)
    ..writeByte(0)
    ..write(obj.number)
    ..writeByte(1)
    ..write(obj.sequence)
    ..writeByte(2)
    ..write(obj.numberOfVerses)
    ..writeByte(3)
    ..write(obj.name)
    ..writeByte(4)
    ..write(obj.revelation)
    ..writeByte(5)
    ..write(obj.preBismillah);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
