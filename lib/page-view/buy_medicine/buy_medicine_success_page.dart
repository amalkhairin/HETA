import 'package:flutter/material.dart';
import 'package:heta_app/components/dashed_line.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/page-view/home_page.dart';

class BuyMedicineSuccessPage extends StatelessWidget {
  final Cart? cart;
  final String? paymentMethod;
  final List<Map<String, dynamic>>? data;
  final String? number;
  BuyMedicineSuccessPage({this.cart, this.paymentMethod, this.data, this.number});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Payment", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: HETACard(
                color: backgroundColor,
                width: screenSize.width,
                height: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, size: 100, color: greenColor,),
                    Text("Payment Successfull", style: TextStyle(color: greenColor, fontSize: 28, fontWeight: FontWeight.w500),),
                    Text("Transaction Number: $number", style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: DashedLine(color: Colors.grey[300], height: 2,),
                    ),
                    Column(
                      children: [
                        Column(
                          children: List.generate(data!.length, (index){
                            return Padding(
                              padding: EdgeInsets.only(left: 24, top: 8, right: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("${data![index]['name']}", style: TextStyle(color: Colors.grey[700])),
                                      SizedBox(width: 8,),
                                      Text("| ${data![index]['total']} x ${cart!.jumlahObat(cart!.listObat![index].id!)}", style: TextStyle(color: Colors.grey[700])),
                                    ],
                                  ),
                                  Text("Rp ${data![index]['total']}", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold))
                                ],
                              ),
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Amount Paid:", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                              Text("Rp ${cart!.totalHarga}", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Payment Method:", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                              Text("${paymentMethod!}", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 42,),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    onPrimary: Colors.white,
                    elevation: 0
                  ),
                  child: Text("Home Page"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}