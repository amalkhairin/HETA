// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_reservasi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryReservasiAdapter extends TypeAdapter<HistoryReservasiModel> {
  @override
  final int typeId = 0;

  @override
  HistoryReservasiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryReservasiModel(
      reservasinumber: fields[0] as String?,
      namaDokter: fields[3] as String?,
      namaKlinik: fields[1] as String?,
      alamatKlinik: fields[2] as String?,
      date: fields[5] as String?,
      time: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryReservasiModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.reservasinumber)
      ..writeByte(1)
      ..write(obj.namaKlinik)
      ..writeByte(2)
      ..write(obj.alamatKlinik)
      ..writeByte(3)
      ..write(obj.namaDokter)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryReservasiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
