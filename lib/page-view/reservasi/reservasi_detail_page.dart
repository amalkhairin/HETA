import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/klinik/klinik.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:heta_app/page-view/reservasi/reservasi_accepted_page.dart';
import 'package:heta_app/utility/number_generator.dart';
import 'package:hive/hive.dart';
import 'package:heta_app/model-logic/model/history/history_reservasi.dart';

class ReservasiDetailPage extends StatefulWidget {
  final Klinik? klinik;
  ReservasiDetailPage({this.klinik});

  @override
  _ReservasiDetailPageState createState() => _ReservasiDetailPageState();
}

class _ReservasiDetailPageState extends State<ReservasiDetailPage> {

  int? _selectedDateIndex = 0;
  int? _selectedTimeIndex = 0;
  int? _selectedOPTimeIndex;
  List _timeList = ["Afternoon", "Night"];
  List _opTimeAfternoonList = ["11.30", "14.00", "15.00"];
  List _opTimeNightList = ["16.00", "17.00", "18.00"];
  String _selectedTime = "";
  List _hari = ["Tuesday, 15 May", "Wednesday, 16 May", "Thursday, 17 May"];
  List _tempHari = ["2021-06-15", "2021-06-16", "2021-06-16"];

  bool _isSelectedAll(){
    return _selectedDateIndex != null && _selectedTimeIndex != null && _selectedOPTimeIndex != null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        title: Text("Set Appointment", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        actions: [],
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 28, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width/2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.klinik!.getName}", style: TextStyle(color: primaryColor, fontSize: 16),),
                          Text("${widget.klinik!.getAddress}", style: TextStyle(color: Colors.grey, fontSize: 13),)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: yellowColor, size: 18,),
                        Text("2.5 km", style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 42),
                child: HETACard(
                  width: screenSize.width,
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 24,),
                      Flexible(
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://post.healthline.com/wp-content/uploads/2019/01/Male_Doctor_732x549-thumbnail.jpg"),
                              fit: BoxFit.contain,
                            ),
                            border: Border.all(color: tertiaryColor, width: 2),
                            shape: BoxShape.circle
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Drh. Tirta Wijaya", style: TextStyle(color: primaryColor, fontSize: 18)),
                          Text("Veternary", style: TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select your visit date", style: TextStyle(color: primaryColor, fontSize: 18)),
                        Text("It is flexible, you are able to deal with", style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text("Pick Date", style: TextStyle(color: Colors.white, fontSize: 13),),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 42),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<Widget>.generate(_hari.length, (index) {
                    return HETACard(
                      onTap: (){
                        setState(() {
                          _selectedDateIndex = index;
                        });
                      },
                      width: screenSize.width/4,
                      height: screenSize.width/3.5,
                      enableBorder: _selectedDateIndex == index,
                      borderColor: tertiaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.wb_sunny, color: yellowColor,),
                                Text("28 C", style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                            Text("${_hari[index]}", style: TextStyle(color: primaryColor, fontSize: 16))
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Text("Select time of your visit", style: TextStyle(color: primaryColor, fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<Widget>.generate(_timeList.length, (index) {
                    return HETACard(
                      onTap: (){
                        setState(() {
                          _selectedTimeIndex = index;
                        });
                      },
                      width: screenSize.width/2.5,
                      height: screenSize.width/6,
                      enableBorder: _selectedTimeIndex! == index,
                      borderColor: tertiaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.wb_sunny, color: yellowColor,),
                            Flexible(child: Text("${_timeList[index]}", style: TextStyle(color: primaryColor, fontSize: 16)))
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<Widget>.generate(3, (index) {
                    return HETACard(
                      onTap: (){
                        setState(() {
                          _selectedOPTimeIndex = index;
                          if(_selectedTimeIndex == 0){
                            _selectedTime = _opTimeAfternoonList[index];
                          } else {
                            _selectedTime = _opTimeNightList[index];
                          }
                        });
                      },
                      width: screenSize.width/4,
                      height: screenSize.width/10,
                      enableBorder: _selectedOPTimeIndex == index,
                      borderColor: tertiaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text(_selectedTimeIndex == 0? "${_opTimeAfternoonList[index]}" : "${_opTimeNightList[index]}", style: TextStyle(color: primaryColor, fontSize: 16))),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: !_isSelectedAll()? null : () async {
                      Database db = Database();
                      PemilikHewan _user = PemilikHewan.instance;
                      print("user: ${_user.id}");
                      var res = await db.insertReservasi(id_pemilikHewan: _user.id, id_klinik: widget.klinik!.id, date: _tempHari[_selectedDateIndex!]);
                      Box _tempBox = Hive.box("historyReservasi");
                      HistoryReservasiModel _tempHistory = HistoryReservasiModel(
                        reservasinumber: Generator.reservationNumber(),
                        namaDokter: "Drh. Tirta Wijaya",
                        namaKlinik: "${widget.klinik!.name}",
                        alamatKlinik: "${widget.klinik!.address}",
                        date: _tempHari[_selectedDateIndex!],
                        time: _selectedTime
                      );
                      _tempBox.putAt(_user.id!, _tempHistory);
                      
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ReservasiAcceptedPage(nama: widget.klinik!.getName,date: _hari[_selectedDateIndex!],))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      onPrimary: Colors.white,
                      elevation: 0,
                    ),
                    child: Text("Done"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}