// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../surah/revelation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RevelationAdapter extends TypeAdapter<Revelation> {
  @override
  final int typeId = 3;

  @override
  Revelation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Revelation(
      arab: fields[0] as String,
      en: fields[1] as String,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Revelation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.arab)
      ..writeByte(1)
      ..write(obj.en)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevelationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
