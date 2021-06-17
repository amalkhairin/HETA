// Import the test package and Counter class
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/model-logic/model/buy_medicine/obat.dart';
import 'package:test/test.dart';

void main() {
  group("sum", (){
    test('Harga seharusnya bertambah x2', () {
      List<Obat> listObat = [
        Obat(id: 1, name: "obat1", harga: 15000),
        Obat(id: 1, name: "obat1", harga: 15000),
        Obat(id: 2, name: "obat2", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
      ];
      Cart cart = Cart(idPemilikHewan: 1, listObat: listObat);

      cart.getHargaObat(1);

      expect(cart.getHargaObat(1), 30000);
    });

    test('Harga seharusnya bertambah x1', () {
      List<Obat> listObat = [
        Obat(id: 1, name: "obat1", harga: 15000),
        Obat(id: 1, name: "obat1", harga: 15000),
        Obat(id: 2, name: "obat2", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
      ];
      Cart cart = Cart(idPemilikHewan: 1, listObat: listObat);

      cart.getHargaObat(2);

      expect(cart.getHargaObat(2), 15000);
    });

    test('Harga seharusnya bertambah x3', () {
      List<Obat> listObat = [
        Obat(id: 1, name: "obat1", harga: 15000),
        Obat(id: 1, name: "obat1", harga: 15000),
        Obat(id: 2, name: "obat2", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
        Obat(id: 3, name: "obat3", harga: 15000),
      ];
      Cart cart = Cart(idPemilikHewan: 1, listObat: listObat);

      cart.getHargaObat(3);

      expect(cart.getHargaObat(3), 45000);
    });
  });
}
