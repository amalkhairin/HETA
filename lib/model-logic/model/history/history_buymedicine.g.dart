// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_buymedicine.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryMedicineAdapter extends TypeAdapter<HistoryBuyMedicineModel> {
  @override
  final int typeId = 1;

  @override
  HistoryBuyMedicineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryBuyMedicineModel(
      transactionNumber: fields[0] as String?,
      alamatPemilikHewan: fields[1] as String?,
      itemCount: fields[2] as int?,
      payment: fields[3] as String?,
      price: fields[4] as double?,
      date: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryBuyMedicineModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.transactionNumber)
      ..writeByte(1)
      ..write(obj.alamatPemilikHewan)
      ..writeByte(2)
      ..write(obj.itemCount)
      ..writeByte(3)
      ..write(obj.payment)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryMedicineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
