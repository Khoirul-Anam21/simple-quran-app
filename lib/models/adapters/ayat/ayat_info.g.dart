// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../ayat/ayat_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AyatInfoAdapter extends TypeAdapter<AyatInfo> {
  @override
  final int typeId = 7;

  @override
  AyatInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AyatInfo(
      juz: fields[0] as int?,
      page: fields[1] as int?,
      manzil: fields[2] as int?,
      ruku: fields[3] as int?,
      hizbQuarter: fields[4] as int?,
      sajda: fields[5] as Sajda?,
    );
  }

  @override
  void write(BinaryWriter writer, AyatInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.juz)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.manzil)
      ..writeByte(3)
      ..write(obj.ruku)
      ..writeByte(4)
      ..write(obj.hizbQuarter)
      ..writeByte(5)
      ..write(obj.sajda);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyatInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
