
class Klinik {
  int? id;
  String? name;
  String? address;
  String? mapLocation;
  String? treatment;
  String? operationalTime;

  Klinik({
    this.id,
    this.name,
    this.address,
    this.mapLocation,
    this.treatment,
    this.operationalTime
  });

  factory Klinik.fromjson(Map<String, dynamic> data){
    return Klinik(
      id : data['id_klinik'],
      name : data['nama_klinik'],
      address : data['address'],
      mapLocation : data['mapLocation'],
      operationalTime: data['operational_time'],
      treatment : data['treatment']
    );
  }

  int? get getId => this.id;

  set setId(int? id) => this.id = id;

  String? get getName => this.name;

  set setName( name) => this.name = name;

  String? get getAddress => this.address;

  set setAddress( address) => this.address = address;

  String? get getMapLocation => this.mapLocation;

  set setMapLocation( mapLocation) => this.mapLocation = mapLocation;

  String? get getTreatment => this.treatment;

  set setTreatment( treatment) => this.treatment = treatment;

  double? getDistance(userPosition){
    return 0;
  }

}