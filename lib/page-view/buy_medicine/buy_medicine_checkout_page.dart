import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/page-view/buy_medicine/buy_medicine_confirm_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyMedicineCheckoutPage extends StatefulWidget {
  final Cart? cart;
  final List<Map<String, dynamic>>? data;
  BuyMedicineCheckoutPage({this.cart, this.data});
  
  @override
  _BuyMedicineCheckoutPageState createState() => _BuyMedicineCheckoutPageState();
}

class _BuyMedicineCheckoutPageState extends State<BuyMedicineCheckoutPage> {
  List _paymentMethods = ["gopay"];
  int? _selectedIndex = 0;
  String _address = "Loading...";

  loadAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _add = "Err";
    _add = await prefs.getString("address")!;
    setState(() {
      _address = _add;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAddress();
  }

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
                              Text("$_address", style: TextStyle(color: primaryColor),),
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
                          children: List.generate(_paymentMethods.length, (index){
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
                                child: Image.network("https://halalkan.com/wp-content/uploads/2021/02/LOGO-GOPAY.png")
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
                            Text("${_paymentMethods[0]} used", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
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
                          children: List.generate(widget.data!.length, (index){
                            return Padding(
                              padding: EdgeInsets.only(left: 24, top: 8, right: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("${widget.data![index]['name']}", style: TextStyle(color: Colors.grey[700])),
                                      SizedBox(width: 8,),
                                      Text("| ${widget.data![index]['total']} x ${widget.cart!.jumlahObat(widget.cart!.listObat![index].id!)}", style: TextStyle(color: Colors.grey[700])),
                                    ],
                                  ),
                                  Text("Rp ${widget.data![index]['total']}", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold))
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
                      MaterialPageRoute(builder: (context) => BuyMedicineConfirmPage(cart: widget.cart, paymentMethod: _paymentMethods[0], data: widget.data, address:_address))
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