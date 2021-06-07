import 'package:flutter/material.dart';
import 'package:heta_app/components/data_not_found.dart';
import 'package:heta_app/components/filters_dialog.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/components/heta_loading_indicator.dart.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/model/buy_medicine/obat.dart';

class BuyMedicineMain extends StatefulWidget {
  @override
  _BuyMedicineMainState createState() => _BuyMedicineMainState();
}

class _BuyMedicineMainState extends State<BuyMedicineMain> {
  List _filterList = ["Cats", "Kittens", "Dogs"];
  List _selectedFilters = [];
  List _selectedFiltersIndex = [];
  List<Obat> _listObat = [];
  List<Obat> _listFilteredObat = [];
  

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
            _listObat.isEmpty
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
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _listObat.length,
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
                                  child: Placeholder(fallbackWidth: 20, fallbackHeight: 100,)
                                ),
                                SizedBox(height: 8,),
                                Text("Trixin", style: TextStyle(color: primaryColor),),
                                Text("Rp120.000", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
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
                                      onPressed: (){},
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
                                    child: Text("1", style: TextStyle(color: Colors.white, fontSize: 14),),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Color(0xFF1C2375),
                                  ),
                                  Flexible(
                                    child: TextButton(
                                      onPressed: (){},
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
          print(_selectedFilters);
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
                child: Text("0", style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
            )
          ],
        ),
      ),
    );
  }
}