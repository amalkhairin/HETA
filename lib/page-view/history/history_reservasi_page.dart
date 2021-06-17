import 'package:flutter/material.dart';
import 'package:heta_app/components/data_not_found.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/components/heta_loading_indicator.dart.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/history/history_reservasi.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryReservasiPage extends StatefulWidget {
  @override
  _HistoryReservasiPageState createState() => _HistoryReservasiPageState();
}

class _HistoryReservasiPageState extends State<HistoryReservasiPage> {
  List<HistoryReservasiModel>? _listHistoryReservasi;
  bool _isLoading = true;
  Database db = Database();
  PemilikHewan _user = PemilikHewan.instance;

  loadHistoryReservasi() async {
    List<HistoryReservasiModel> _temp = [];
    var res = await db.getHistoryReservasi();
    if (res != false) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      for (var i = 0; i < res.length; i++) {
        // _temp.add(HistoryReservasi.fromJson(res[i]));
      }
      if(mounted){
        setState(() {
          _listHistoryReservasi = _temp;
        });
      }
    }
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  loadData() async {
    List<HistoryReservasiModel> _temp = [];
    Box _box = await Hive.openBox("historyReservasi");
    for (var i = 0; i < _box.length; i++) {
      _temp.add(_box.get(i));
    }
    if(mounted){
      setState(() {
        _listHistoryReservasi = _temp;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    // loadHistoryReservasi();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return _isLoading
    ? Container(
      child: Center(child: HETALoadingIndicator()),
    )
    : Container(
      color: backgroundColor,
      child: _listHistoryReservasi != null
      ? ValueListenableBuilder(
        valueListenable: Hive.box("historyReservasi").listenable(),
        builder: (context, Box box, _) {
          if(box.isNotEmpty){
            // setState(() {
              
            // });
          }
          return ListView.builder(
            itemCount: _listHistoryReservasi!.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                child: HETACard(
                  width: screenSize.width,
                  height: 136,
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
                              Text("Reservation Number: ${_listHistoryReservasi![index].reservasinumber}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text("${_listHistoryReservasi![index].namaKlinik}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                              Text("${_listHistoryReservasi![index].alamatKlinik}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: primaryColor, fontWeight: FontWeight.w300)),
                              SizedBox(height: 6,),
                              Text("${_listHistoryReservasi![index].namaDokter}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                              Text("Time: ${_listHistoryReservasi![index].time}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        Text("${_listHistoryReservasi![index].date}", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      )
      : DataNotFoundMessage(
        title: "Hmm.. Seems like nothing here",
        subtitle: "Let's reserve the best vet in town for your pet",
      )
    );
  }
}