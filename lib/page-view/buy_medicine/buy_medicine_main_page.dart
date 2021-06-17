import 'package:flutter/material.dart';
import 'package:heta_app/components/data_not_found.dart';
import 'package:heta_app/components/filters_dialog.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/components/heta_loading_indicator.dart.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/cart.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/buy_medicine/obat.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:heta_app/page-view/buy_medicine/buy_medicine_cart_page.dart';

class BuyMedicineMainPage extends StatefulWidget {
  @override
  _BuyMedicineMainPageState createState() => _BuyMedicineMainPageState();
}

class _BuyMedicineMainPageState extends State<BuyMedicineMainPage> {
  TextEditingController _searchController = TextEditingController();

  List _filterList = ["Cats", "Kittens", "Dogs"];
  List _selectedFilters = [];
  List _selectedFiltersIndex = [];
  List<Obat>? _listObat;
  List<Obat>? _listFilteredObat;
  List<Obat> _listSelectedObat = [];
  List? _listQty;
  Database db = Database();
  PemilikHewan _user = PemilikHewan.instance;
  Cart? _cart;
  int _totalQty = 0;
  bool _isLoading = true;

  decrease(int index){
    setState(() {
      if(_listQty![index] > 0){
        _listQty![index]--;
        _totalQty--;
      }
    });
  }

  increase(int index){
    setState(() {
      _listQty![index]++;
      _totalQty++;
    });
  }

  loadMedicie() async {
    List<Obat> _temp = [];
    var res = await db.getAllMedicine();
    if(res != false){
      if(mounted){
        setState(() {
          _isLoading = false;
        });
      }
      for (var i = 0; i < res.length; i++) {
        _temp.add(Obat.fromJson(res[i]));
      }
      if(mounted){
        setState(() {
          _listObat = _temp;
          _listFilteredObat = _temp;
          _listQty = List.generate(_temp.length, (index) => 0);
        });
      }
    }
    if (mounted) {
      setState(() {
        _listObat = _temp;
        _listFilteredObat = _temp;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMedicie();
    _cart = Cart(idPemilikHewan: _user.id, listObat: []);
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
        title: Text("Buy Medicine", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        actions: [],
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _isLoading ? Center(child: HETALoadingIndicator()) :
            _listObat!.isEmpty
            ? Center(
              child: DataNotFoundMessage(
                header: "Oops!\nProduct not found",
                subtitle: "Please try other keywords to help us\nsearch what are you looking for",
              )
            )
            : ListView(
              physics: BouncingScrollPhysics(),
              children: [
                _selectedFilters.isEmpty
                ? SizedBox(height: 92,)
                : SizedBox(height: 142,),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: _isLoading
                  ? Center(child: HETALoadingIndicator(),)
                  : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _listFilteredObat!.length,
                    itemBuilder: (context, index){
                      return HETACard(
                        width: screenSize.width/2.5,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 8,),
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.network("${_listFilteredObat![index].image}")
                                ),
                                SizedBox(height: 8,),
                                Text("${_listFilteredObat![index].name}", style: TextStyle(color: primaryColor),),
                                Text("${_listFilteredObat![index].harga}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: TextButton(
                                      onPressed: (){
                                        decrease(index);
                                        setState(() {
                                          _listSelectedObat.remove(_listFilteredObat![index]);
                                          _cart!.updateCart(listObat: _listSelectedObat);
                                        });
                                      },
                                      child: Text("-", style: TextStyle(color: Colors.white, fontSize: 18),),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Color(0xFF1C2375),
                                  ),
                                  TextButton(
                                    onPressed: null,
                                    child: Text("${_listQty![index]}", style: TextStyle(color: Colors.white, fontSize: 14),),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Color(0xFF1C2375),
                                  ),
                                  Flexible(
                                    child: TextButton(
                                      onPressed: (){
                                        increase(index);
                                        setState(() {
                                         _listSelectedObat.add(_listFilteredObat![index]);
                                         _cart!.updateCart(listObat: _listSelectedObat);
                                        });
                                      },
                                      child: Text("+", style: TextStyle(color: Colors.white, fontSize: 18),),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: (screenSize.width/2.5)/200,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 210,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HETACard(
                            width: screenSize.width - screenSize.width*0.30,
                            height: 64,
                            child: TextFormField(
                              controller: _searchController,
                              onChanged: (value){
                                setState(() {
                                  _listFilteredObat = _listObat!;
                                });
                                if(value.isNotEmpty){
                                  List<Obat> _temp = [];
                                  for (var i = 0; i < _listFilteredObat!.length; i++) {
                                    if(_listFilteredObat![i].getName()!.toLowerCase().contains(value.toLowerCase())){
                                      _temp.add(_listFilteredObat![i]);
                                    }
                                  }
                                  setState(() {
                                    _listFilteredObat = _temp;
                                  });
                                } else {
                                  setState(() {
                                    _listFilteredObat = _listObat!;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "What medicine are you looking for?",
                                hintStyle: TextStyle(color: Color(0xFF9B9B9B), fontSize: 13),
                                border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
                                prefixIcon: Icon(Icons.search)
                              ),
                            ),
                          ),
                          HETACard(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text("Select Filters"),
                                    content: FiltersDialog(filterList: _filterList, selectedFilters: _selectedFilters,),
                                    actions: [
                                      TextButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                          setState(() {
                                            
                                          });
                                        },
                                        child: Text("Ok"),
                                      ),
                                    ],
                                  );
                                }
                              );
                            },
                            width: screenSize.width - screenSize.width*0.85,
                            height: 64,
                            color: Colors.white,
                            child: Icon(Icons.sort, color: primaryColor,),
                          )
                        ],
                      ),
                      _selectedFilters.isNotEmpty
                      ? Container(
                        width: screenSize.width,
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _selectedFilters.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.only(left: index == 0? 0 : 8, right: index == _selectedFilters.length-1? 0 : 8),
                              child: HETACard(
                                width: 100,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            _selectedFilters.remove("${_selectedFilters[index]}");
                                          });
                                        },
                                        child: Icon(Icons.cancel, color: primaryColor,),
                                      ),
                                    ),
                                    Expanded(child: Text("${_selectedFilters[index]}", style: TextStyle(color: primaryColor),))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BuyMedicineCartPage(cart: _cart,))
          );
        },
        elevation: 4,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(color: Colors.white, width: 2),
                shape: BoxShape.circle
              ),
            ),
            Center(
              child: Icon(Icons.shopping_cart_rounded),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: tertiaryColor,
                radius: 10,
                child: _isLoading ? Text("0", style: TextStyle(color: Colors.white, fontSize: 12),) : Text("${_cart!.totalJumlahObat}", style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
            )
          ],
        ),
      ),
    );
  }
}