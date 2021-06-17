import 'package:flutter/material.dart';
import 'package:heta_app/components/data_not_found.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/components/heta_loading_indicator.dart.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/history/history_buymedicine.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryBuyMedicinePage extends StatefulWidget {
  @override
  _HistoryBuyMedicinePageState createState() => _HistoryBuyMedicinePageState();
}

class _HistoryBuyMedicinePageState extends State<HistoryBuyMedicinePage> {
  List<HistoryBuyMedicineModel> _listHistoryBuyMedicine = [];
  bool _isLoading = true;
  PemilikHewan _user = PemilikHewan.instance;

  Database db = Database();

  loadHistoryBuyMedicine() async {
    List<HistoryBuyMedicineModel> _temp = [];
    var res = await db.getHistoryReservasi();
    if (res != false) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      for (var i = 0; i < res.length; i++) {
        // _temp.add(HistoryBuyMedicine.fromJson(res[i]));
      }
      if(mounted){
        setState(() {
          _listHistoryBuyMedicine = _temp;
        });
      }
    }

    if(mounted){
      setState(() {
        _isLoading = false;
      });
    }
  }

  loadData() async {
    Box _box = await Hive.openBox("historyMedicine");
    if(mounted){
      setState(() {
        for (var i = 0; i < _box.length; i++) {
          _listHistoryBuyMedicine.add(_box.get(i));
        }
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadHistoryBuyMedicine();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    
    if(_isLoading) {
      return Center(
        child: HETALoadingIndicator(),
      );
    } else {
      return Container(
        color: backgroundColor,
        child: _listHistoryBuyMedicine.isNotEmpty
        ? FutureBuilder(
          future: Hive.openBox("historyMedicine"),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return Center(
                  child: DataNotFoundMessage(
                    title: "Hmm.. Seems like nothing here",
                    subtitle: "Let's buy some medicine for your lovely pet",
                  ),
                );
              } else {
                Box _box = Hive.box("historyMedicine");
                return ValueListenableBuilder(
                  valueListenable: _box.listenable(),
                  builder: (context, Box box, _) {
                    // if(box.isNotEmpty){
                    //   setState(() {
                    //     for (var i = 0; i < box.length; i++) {
                    //       _listHistoryBuyMedicine.add(box.get(i));
                    //     }
                    //   });
                    // }
                    return ListView.builder(
                      itemCount: _listHistoryBuyMedicine.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                          child: HETACard(
                            width: screenSize.width,
                            height: 100,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenSize.width/2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Transaction Number: ${_listHistoryBuyMedicine[index].transactionNumber}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10,),
                                        Text("${_listHistoryBuyMedicine[index].alamatPemilikHewan}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                                        Text("${_listHistoryBuyMedicine[index].itemCount} items", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w300)),
                                        Text("${_listHistoryBuyMedicine[index].payment}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                  ),
                                  Text("${_listHistoryBuyMedicine[index].date}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                );
              }
            } else {
              return Center(child: HETALoadingIndicator(),);
            }
          }
        )
        : DataNotFoundMessage(
          title: "Hmm.. Seems like nothing here",
          subtitle: "Let's buy some medicine for your lovely pet",
        )
      );
    }
  }
}
