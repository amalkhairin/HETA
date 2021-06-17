import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:heta_app/constant/url_path.dart';

/// Class database
/// merupakan model dari class database
/// parameter api untuk url endpoint database : API
class Database {
  API? api;
  // singleton
  static final _instance = Database._internal();
  Database._internal();
  factory Database() => _instance;

  // login user
  Future<dynamic> userLogin({String? username, String? password})async {
    try {
      var url = Uri.https(API.URL, API.LOGIN);
      print(url);
      var response = await http.post(url, body: {
        "username": username,
        "password": password
      });
      print(response.body);
      if(response.statusCode == 200){
        print(response.body);
        var jsonRes = json.decode(response.body);
        if(jsonRes['success'] == true)
          return jsonRes;
        return false;
      }
      return false;
    } catch (e) {
      print("login error: $e");
      return false;
    }
  }

  // create new user / register
  Future<dynamic> createNewUser({String? fullname, String? username, String? email, String? password})async {
    try {
      var url = Uri.https(API.URL, API.REGISTER);
      var response = await http.post(url, body: {
        "fullname": fullname,
        "username": username,
        "email" : email,
        "password": password
      });
      if(response.statusCode == 200){
        var jsonRes = json.decode(response.body);
        print(response.body);
        if(jsonRes['success'] == true)
          return jsonRes;
        return false;
      }
      return false;
    } catch (e) {
      print("register error: $e");
      return false;
    }
  }

  // get all article
  Future<dynamic> getAllArticle() async {
    try {
      var url = Uri.https(API.URL, API.ARTICLE);
      var response = await http.get(url);
      if(response.statusCode == 200){
        print(response.body);
        var jsonRes = json.decode(response.body);
        return jsonRes;
      }
      return false;
    } catch (e) {
      print("get article error: $e");
      return false;
    }
  }

  // get all klinik
  Future<dynamic> getAllKlinik() async {
    try {
      var url = Uri.https(API.URL, API.KLINIK_ALL);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonRes = json.decode(response.body);
        return jsonRes;
      }
      return false;
    } catch (e) {
      print("get all klinik error: $e");
      return false;
    }
  }

  // get all medicine
  Future<dynamic> getAllMedicine() async {
    try {
      var url = Uri.https(API.URL, API.MEDICINE_ALL);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonRes = json.decode(response.body);
        return jsonRes;
      }
      return false;
    } catch (e) {
      print("get all medicine error: $e");
      return false;
    }
  }

  // create new reservation / insert reservation
  Future<dynamic> insertReservasi({int? id_pemilikHewan, int? id_klinik, String? date}) async {
    try {
      var url = Uri.https(API.URL, API.INSERT_RESERVASI);
      var response = await http.post(url, body: {
        "id_pemilikHewan": id_pemilikHewan.toString(),
        "id_klinik": id_klinik.toString(),
        "date" : date
      });
      if(response.statusCode == 200){
        print(response.body);
        var jsonRes = json.decode(response.body);
        if(jsonRes['success'] == true)
          return true;
        return false;
      }
      return false;
    } catch (e) {
      print("insert reservasi error: $e");
      return false;
    }
  }

  // get history reservasi
  Future<dynamic> getHistoryReservasi() async {
    try {
      var url = Uri.https(API.URL, API.HISTORY_RESERVASI);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonRes = json.decode(response.body);
        return jsonRes;
      }
      return false;
    } catch (e) {
      print("get history reservasi error: $e");
      return false;
    }
  }

  // get history medicine
  Future<dynamic> getHistoryMedicine() async {
    try {
      var url = Uri.https(API.URL, API.HISTORY_MEDICINE);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonRes = json.decode(response.body);
        return jsonRes;
      }
      return false;
    } catch (e) {
      print("get history medicine error: $e");
      return false;
    }
  }

  // add new transaction medicine
  Future<dynamic> addTransaction(int id, List<Map<String, dynamic>> listObat, String alamat, String paymentMethod) async {
    try {
      var url = Uri.https(API.URL, API.MEDICINE_PAYMENT);
      List<Map<String, dynamic>> _temp = [];
      for (var i = 0; i < listObat.length; i++) {
        _temp.add({
          "id_obat": listObat[i]['id_obat'],
          "qty": listObat[i]['qty']
        });
      }
      var reqBody = {
        "id_pemilikHewan": id.toString(),
        "list_obat": _temp,
        "alamat": alamat,
        "paymentMethod": paymentMethod
      };
      var body = json.encode(reqBody);
      print(body.runtimeType);
      var response = await http.post(url, body: body, headers: {'Content-type': 'application/json'});
      if (response.statusCode == 200) {
        print(response.body);
        var jsonRes = json.decode(response.body);
        return jsonRes;
      }
      return false;
    } catch (e) {
      print("add transaction error: $e");
      return false;
    }
  }
}