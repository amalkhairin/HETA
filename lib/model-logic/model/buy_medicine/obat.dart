
// class model obat
class Obat {
  int? id;
  String? name;
  int? harga;
  String? image;

  // constructor default
  Obat({
    this.id,
    this.name,
    this.harga,
    this.image
  });
  
  // json serialisation
  factory Obat.fromJson(Map<String, dynamic> data){
    return Obat(
      id : data['id_obat'],
      name : data['name'],
      harga : data['harga'],
      image : data['image'],
    );
  }

  // setter getter default
  int? getId() => this.id;

  set setId(int? value) {
    this.id = value;
  }

  String? getName() => this.name;

  set setName(String? value) {
    this.name = value;
  }

  int? getHarga() => this.harga;

  set setHarga(int? value) {
    this.harga = value;
  }

  String? getImage() => this.image;

  set setImage(String? value) {
    this.image = value;
  }
}