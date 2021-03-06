
import 'package:hive/hive.dart';
part 'history_reservasi.g.dart';

// history reservasi class
class HistoryReservasi {
  String? reservasinumber;
  String? namaKlinik;
  String? alamatKlinik;
  String? namaDokter;
  String? time;
  String? date;

  // default constructor
  HistoryReservasi({
    this.reservasinumber,
    this.namaDokter,
    this.namaKlinik,
    this.alamatKlinik,
    this.date,
    this.time
  });

  // json serialization
  factory HistoryReservasi.fromJson(Map<String, dynamic> data){
    return HistoryReservasi(
      reservasinumber: data['reservasi_number'],
      namaKlinik: data['nama_klinik'],
      alamatKlinik: data['alamat_klinik'],
      namaDokter: data['nama_dokter'],
      date: data['date'].toString().substring(0,9),
      time: data['time']
    );
  }
}

// historyReservasi class model
@HiveType(adapterName: "HistoryReservasiAdapter",typeId: 0)
class HistoryReservasiModel {
  @HiveField(0)
  String? reservasinumber;
  @HiveField(1)
  String? namaKlinik;
  @HiveField(2)
  String? alamatKlinik;
  @HiveField(3)
  String? namaDokter;
  @HiveField(4)
  String? time;
  @HiveField(5)
  String? date;

  // default constructor
  HistoryReservasiModel({
    this.reservasinumber,
    this.namaDokter,
    this.namaKlinik,
    this.alamatKlinik,
    this.date,
    this.time
  });
}