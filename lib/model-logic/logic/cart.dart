
import 'package:heta_app/model-logic/model/buy_medicine/obat.dart';
import 'package:flutter/material.dart';

// class model-logic cart
class Cart {
  int? _idPemilikHewan;
  List<Obat>? _listObat;

  Cart({int? idPemilikHewan, List<Obat>? listObat}){
    this._idPemilikHewan = idPemilikHewan;
    this._listObat = listObat;
  }

  static final _instance = Cart._internal();
  Cart._internal();
  static Cart get instance => _instance;

  int? get idPemilikHewan => this._idPemilikHewan;

  set idPemilikHewan(int? value) => this._idPemilikHewan = value;

  List<Obat>? get listObat => this._listObat;

  set listObat(value) => this._listObat = value;

  double? get totalHarga {
    double _totalHarga = 0;
    for (Obat obat in this._listObat!) {
      _totalHarga += obat.harga!;
    }
    return _totalHarga;
  }

  int? get totalJumlahObat => this._listObat!.length;

  double getHargaObat(int idObat){
    double harga = 0;
    for (Obat obat in this._listObat!) {
      if(obat.id == idObat){
        harga += obat.harga!;
      }
    }
    return harga;
  }

  int jumlahObat(int idObat) {
    int sum = 0;

    for (Obat obat in this._listObat!) {
      if(obat.id == idObat){
        sum++;
      }
    }

    return sum;
  }

  void updateCart({List<Obat>? listObat}){
    this._listObat = listObat;
  }

  List<Obat> showCart(){
    return this._listObat!;
  }

  List<Obat> getObatById(int id){
    List<Obat> _temp = [];
    for (Obat item in this._listObat!) {
      if(item.id == id){
        _temp.add(item);
      }
    }
    return _temp;
  }
}