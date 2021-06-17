
import 'dart:math';

class Generator {
  static String transactionNumber() {
    Random random = Random();
    return "000" + random.nextInt(1000).toString();
  }

  static String reservationNumber() {
    Random random = Random();
    return "000" + random.nextInt(1000).toString();
  }
}