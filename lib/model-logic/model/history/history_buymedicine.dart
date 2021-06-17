
import 'package:hive/hive.dart';
part 'history_buymedicine.g.dart';

class HistoryBuyMedicine {
  String? transactionNumber;
  String? alamatPemilikHewan;
  int? itemCount;
  String? payment;
  double? price;
  String? date;

  HistoryBuyMedicine({
    this.transactionNumber,
    this.alamatPemilikHewan,
    this.itemCount,
    this.payment,
    this.price,
    this.date
  });

  factory HistoryBuyMedicine.fromJson(Map<String, dynamic> data){
    return HistoryBuyMedicine(
      transactionNumber: data['transaction_number'],
      alamatPemilikHewan: data['alamat_pemilik_hewan'],
      itemCount: data['item_count'],
      payment: data['payment'],
      date: data['date'].toString().substring(0,9),
      price: data['price']
    );
  }

}

@HiveType(adapterName:"HistoryMedicineAdapter", typeId: 1)
class HistoryBuyMedicineModel {
  @HiveField(0)
  String? transactionNumber;
  @HiveField(1)
  String? alamatPemilikHewan;
  @HiveField(2)
  int? itemCount;
  @HiveField(3)
  String? payment;
  @HiveField(4)
  double? price;
  @HiveField(5)
  String? date;

  HistoryBuyMedicineModel({
    this.transactionNumber,
    this.alamatPemilikHewan,
    this.itemCount,
    this.payment,
    this.price,
    this.date
  });

}