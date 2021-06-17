import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/page-view/buy_medicine/buy_medicine_confirm_page.dart';

class BuyMedicineCheckoutPage extends StatefulWidget {
  final Cart? cart;
  BuyMedicineCheckoutPage({this.cart});
  
  @override
  _BuyMedicineCheckoutPageState createState() => _BuyMedicineCheckoutPageState();
}

class _BuyMedicineCheckoutPageState extends State<BuyMedicineCheckoutPage> {
  List _paymentMethods = ["gopay"];
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: primaryColor,),
        ),
        title: Text("Checkout", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        actions: [],
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: HETACard(
                onTap: (){},
                width: screenSize.width,
                height: 72,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Deliver to", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.place, color: tertiaryColor,),
                              Text("Kost Darul Ilmi", style: TextStyle(color: primaryColor),),
                            ],
                          ),
                          Text("3.5 km", style: TextStyle(color: primaryColor))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, right: 24, left: 24),
              child: HETACard(
                width: screenSize.width,
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24, top: 12),
                          child: Text("Payment with", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: List.generate(2, (index){
                            return Padding(
                              padding: EdgeInsets.only(left: 24, top: 12,),
                              child: HETACard(
                                onTap: (){
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                width: screenSize.width/3.5,
                                height: 50,
                                enableBorder: _selectedIndex == index,
                                borderColor: tertiaryColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      child: Placeholder(),
                                    ),
                                    Text("${_paymentMethods[index]}"),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    Container(
                      width: screenSize.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[200]!)
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${_paymentMethods[_selectedIndex!]} used", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                            Text("- ${widget.cart!.totalHarga}", style: TextStyle(color: tertiaryColor, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, right: 24, left: 24),
              child: HETACard(
                width: screenSize.width,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24, top: 12),
                          child: Text("Payment total", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
                        ),
                        Column(
                          children: List.generate(widget.cart!.listObat!.length, (index){
                            return Padding(
                              padding: EdgeInsets.only(left: 24, top: 8, right: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("${widget.cart!.listObat![index].name}", style: TextStyle(color: Colors.grey[700])),
                                      SizedBox(width: 8,),
                                      Text("| ${widget.cart!.getHargaObat(widget.cart!.listObat![index].id!)} x ${widget.cart!.jumlahObat(widget.cart!.listObat![index].id!)}", style: TextStyle(color: Colors.grey[700])),
                                    ],
                                  ),
                                  Text("Rp ${widget.cart!.getHargaObat(widget.cart!.listObat![index].id!)}", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold))
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    Container(
                      width: screenSize.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[200]!)
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Total"),
                            Text("Rp ${widget.cart!.totalHarga}", style: TextStyle(color: tertiaryColor, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 42, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BuyMedicineConfirmPage(cart: widget.cart, paymentMethod: _paymentMethods[_selectedIndex!],))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tertiaryColor,
                    onPrimary: Colors.white,
                    elevation: 0,
                  ),
                  child: Text("Pay"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}