// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../ayat/ayat_sajadah.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SajdaAdapter extends TypeAdapter<Sajda> {
  @override
  final int typeId = 8;

  @override
  Sajda read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sajda(
      recommended: fields[0] as bool?,
      obligatory: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Sajda obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.recommended)
      ..writeByte(1)
      ..write(obj.obligatory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SajdaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
