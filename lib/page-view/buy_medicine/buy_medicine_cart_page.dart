import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/model-logic/model/buy_medicine/obat.dart';
import 'package:heta_app/page-view/buy_medicine/buy_medicine_checkout_page.dart';

class BuyMedicineCartPage extends StatefulWidget {
  final Cart? cart;
  BuyMedicineCartPage({this.cart});

  @override
  _BuyMedicineCartPageState createState() => _BuyMedicineCartPageState();
}

class _BuyMedicineCartPageState extends State<BuyMedicineCartPage> {

  List<Obat> _listObat = [];
  List<Map<String,dynamic>> _dataObat = [];
  Cart? _cart;

  loadData() async {
    List<Map<String,dynamic>> _temp = [];
    Map<String, dynamic> _listObat = {
      "id_obat": 0,
      "qty": 0,
    };
    int idPrev = 0;

    for (var i = 0; i < _cart!.listObat!.length; i++) {
      // _listObat['id_obat'] = widget.cart!.listObat![i].id!;
      if(idPrev != _cart!.listObat![i].id!){
        int qty = _cart!.jumlahObat(_cart!.listObat![i].id!);
        double total = _cart!.getHargaObat(_cart!.listObat![i].id!);
        _temp.add({
          "id_obat": _cart!.listObat![i].id!,
          "name": _cart!.listObat![i].name,
          "image": _cart!.listObat![i].image,
          "total": total,
          "qty": qty
        });
      }
      idPrev = _cart!.listObat![i].id!;
    }
    print(_temp);
    setState(() {
      _dataObat = _temp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cart = widget.cart!;
    _listObat = widget.cart!.listObat!;
    loadData();
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
        title: Text("Cart", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        actions: [],
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: _dataObat.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.fromLTRB(24, index == 0? 24 : 8, 24, index == 1? 24 : 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenSize.width/2,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.network("${_cart!.listObat![index].image}")
                            ),
                            SizedBox(width: 14,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${_dataObat[index]['name']}", style: TextStyle(color: primaryColor)),
                                Text("${_dataObat[index]['total']}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextButton(
                                onPressed: (){
                                  setState(() {
                                    _listObat.remove(_listObat[index]);
                                    _cart!.updateCart(listObat: _listObat);
                                  });
                                  loadData();
                                },
                                child: Text("-", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 1,
                              color: Color(0xFF1C2375),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 14, right: 14),
                              child: Text("${_dataObat[index]['qty']}", style: TextStyle(color: Colors.white, fontSize: 14),),
                            ),
                            Container(
                              height: 50,
                              width: 1,
                              color: Color(0xFF1C2375),
                            ),
                            Flexible(
                              child: TextButton(
                                onPressed: (){
                                  setState(() {
                                    _listObat.add(_listObat[index]);
                                    _cart!.updateCart(listObat: _listObat);
                                  });
                                  loadData();
                                },
                                child: Text("+", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: ElevatedButton(
                      onPressed:(){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BuyMedicineCheckoutPage(cart: _cart, data: _dataObat))
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Checkout"),
                              SizedBox(width: 8,),
                              Text("|", style: TextStyle(color: Colors.white54),),
                              SizedBox(width: 8,),
                              Text("${_cart!.totalJumlahObat} Items", style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                          Text("Rp ${_cart!.totalHarga}")
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF2831A5),
                        onPrimary: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}