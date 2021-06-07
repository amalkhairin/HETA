
class Klinik {
  int? id;
  String? name;
  String? address;
  List<String>? mapLocation;
  String? treatment;

  Klinik({int? id, String? name, String? address, List<String>? mapLocation, String? treatment}){
    this.id = id;
    this.name = name;
    this.address = address;
    this.mapLocation = mapLocation;
    this.treatment = treatment;
  }

  int? get getId => this.id;

  set setId(int? id) => this.id = id;

  String? get getName => this.name;

  set setName( name) => this.name = name;

  String? get getAddress => this.address;

  set setAddress( address) => this.address = address;

  List<String>? get getMapLocation => this.mapLocation;

  set setMapLocation( mapLocation) => this.mapLocation = mapLocation;

  String? get getTreatment => this.treatment;

  set setTreatment( treatment) => this.treatment = treatment;

}