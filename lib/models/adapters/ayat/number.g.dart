// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../ayat/number.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NumberAdapter extends TypeAdapter<Number> {
  @override
  final int typeId = 6;

  @override
  Number read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Number(
      inQuran: fields[0] as int?,
      inSurah: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Number obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.inQuran)
      ..writeByte(1)
      ..write(obj.inSurah);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NumberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
