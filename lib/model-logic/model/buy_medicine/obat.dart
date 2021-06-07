
class Obat {
  int? _id;
  String? _name;
  double? _harga;
  String? _image;

  Obat({int? id, String? name, double? harga, String? image}){
    this._id = id;
    this._name = name;
    this._harga = harga;
    this._image = image;
  }

  int? get id => this._id;

  set id(int? value) {
    this._id = value;
  }

  String? get name => this._name;

  set name(String? value) {
    this._name = value;
  }

  double? get harga => this._harga;

  set harga(double? value) {
    this._harga = value;
  }

  String? get image => this._image;

  set image(String? value) {
    this._image = value;
  }
}