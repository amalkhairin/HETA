
import 'dart:math';

class Generator {
  static String transactionNumber() {
    Random random = Random();
    return "MED-" + random.nextInt(2000).toString();
  }

  static String reservationNumber() {
    Random random = Random();
    return "RES-" + random.nextInt(2000).toString();
  }
}