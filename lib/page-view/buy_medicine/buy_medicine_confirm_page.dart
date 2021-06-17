import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/model-logic/model/history/history_buymedicine.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:heta_app/page-view/buy_medicine/buy_medicine_success_page.dart';
import 'package:heta_app/utility/number_generator.dart';
import 'package:hive/hive.dart';

class BuyMedicineConfirmPage extends StatelessWidget {
  final Cart? cart;
  final String? paymentMethod;
  BuyMedicineConfirmPage({this.cart, this.paymentMethod});
  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: Color(0xFF00AED6),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24, 42, 24, 24),
              child: Container(
                width: screenSize.width/2,
                height: 72,
                child: Placeholder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text("081 251 666 870 - HewanKita", textAlign: TextAlign.center, style: TextStyle(fontSize: 24),),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Text("or scan our QR Code below", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Container(
                width: screenSize.width,
                height: screenSize.width-42,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Placeholder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 42, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: (){
                    Box _tempBox = Hive.box("historyMedicine");
                    PemilikHewan _user = PemilikHewan.instance;
                    HistoryBuyMedicineModel _tempMedicine = HistoryBuyMedicineModel(
                      transactionNumber: Generator.transactionNumber(),
                      alamatPemilikHewan: "alamat",
                      itemCount: cart!.totalJumlahObat,
                      payment: paymentMethod,
                      price: cart!.totalHarga,
                      date: DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString()
                    );
                    _tempBox.putAt(_user.id!, _tempMedicine);

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => BuyMedicineSuccessPage(cart: cart, paymentMethod: paymentMethod,))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFDA57D),
                    onPrimary: Colors.white,
                    elevation: 0,
                  ),
                  child: Text("Confirm Payment"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}