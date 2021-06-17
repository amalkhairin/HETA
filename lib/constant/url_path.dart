
class API {
  // base url
  static const URL = "1a912083842d.ngrok.io";

  // path
  static const LOGIN = "/v1/login/form";
  static const REGISTER = "/v1/register/form";
  static const ARTICLE = "/v1/article/getAll";
  static const HISTORY = "/v1/history";
  static const HISTORY_RESERVASI = HISTORY + "/reservasi";
  static const HISTORY_MEDICINE = HISTORY + "/medicine";
  static const KLINIK_ALL = "/v1/reservasi/getAllKlinik";
  static const INSERT_RESERVASI = "/v1/reservasi/insert";
  static const MEDICINE_ALL = "/v1/medicine/getAll";
  static const MEDICINE_PAYMENT = "v1/medicine/payment";
}