import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/history/history_buymedicine.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:heta_app/page-view/buy_medicine/buy_medicine_success_page.dart';
import 'package:heta_app/page-view/home_page.dart';
import 'package:heta_app/utility/number_generator.dart';
import 'package:hive/hive.dart';

class BuyMedicineConfirmPage extends StatefulWidget {
  final Cart? cart;
  final String? paymentMethod;
  final List<Map<String, dynamic>>? data;
  final String? address;
  BuyMedicineConfirmPage({this.cart, this.paymentMethod, this.data, this.address});

  @override
  _BuyMedicineConfirmPageState createState() => _BuyMedicineConfirmPageState();
}

class _BuyMedicineConfirmPageState extends State<BuyMedicineConfirmPage> {

  bool _isLoading = false;

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
                child: Image.network("https://halalkan.com/wp-content/uploads/2021/02/LOGO-GOPAY.png"),
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
                child: Image.network("https://i.ibb.co/JF5tzNq/image-17.png", fit: BoxFit.fill,),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 42, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _isLoading? (){} : () async {
                    setState(() {
                      _isLoading = true;
                    });
                    Box _tempBox = await Hive.openBox("historyMedicine");
                    PemilikHewan _user = PemilikHewan.instance;
                    Database db = Database();
                    var date = DateTime.now();
                    String trasnumber = Generator.transactionNumber();
                    HistoryBuyMedicineModel _tempMedicine = HistoryBuyMedicineModel(
                      transactionNumber: trasnumber,
                      alamatPemilikHewan: widget.address!,
                      itemCount: widget.cart!.totalJumlahObat,
                      payment: widget.paymentMethod,
                      price: widget.cart!.totalHarga,
                      date: date.hour.toString() + ":" + date.minute.toString()
                    );
                    // print(data);
                    var res = await db.addTransaction(_user.id!, widget.data!, widget.address!, widget.paymentMethod!);
                    // print(data!.toString());
                    if(res != false){
                      setState(() {
                        _isLoading = false;
                      });
                      _tempBox.add(_tempMedicine);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BuyMedicineSuccessPage(cart: widget.cart, paymentMethod: widget.paymentMethod, data: widget.data!, number: trasnumber))
                      );
                    } else {
                      setState(() {
                        _isLoading = false;
                      });
                      showDialog(
                        context: context, 
                        builder: (context){
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Transaction Failed!\nPlease check you internet connection"),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => HomePage())
                                  );
                                },
                                child: Text("Ok"),
                              )
                            ],
                          );
                        }
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFDA57D),
                    onPrimary: Colors.white,
                    elevation: 0,
                  ),
                  child: _isLoading? CircularProgressIndicator(color: Colors.white,) : Text("Confirm Payment"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}