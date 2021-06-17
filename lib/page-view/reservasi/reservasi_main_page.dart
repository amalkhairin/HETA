import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/components/heta_loading_indicator.dart.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/klinik/klinik.dart';
import 'package:heta_app/page-view/reservasi/reservasi_detail_page.dart';
import 'package:heta_app/page-view/reservasi/reservasi_search_page.dart';

class ReservasiMainPage extends StatefulWidget {
  @override
  _ReservasiMainPageState createState() => _ReservasiMainPageState();
}

class _ReservasiMainPageState extends State<ReservasiMainPage> {
  TextEditingController _searchController = TextEditingController();
  List<Klinik>? _listKlinik;
  List<Klinik>? _listTempKlinik = [];
  Database db = Database();

  loadKlinik() async {
    List<Klinik> _temp = [];
    var res = await db.getAllKlinik();
    if(res != false){
      for (var i = 0; i < res.length; i++) {
        _temp.add(Klinik.fromjson(res[i]));
      }
      setState(() {
        _listKlinik = _temp;
        _listTempKlinik = _temp;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadKlinik();
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
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.place, color: Color(0xFFFFCF5C),),
              Text("Bandung", style: TextStyle(color: primaryColor),)
            ],
          ),
        ),
        centerTitle: true,
        actions: [],
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: 64,),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text("Select for Treatment", style: TextStyle(fontSize: 18, color: tertiaryColor),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HETACard(
                            onTap: _listKlinik == null? (){} : (){
                              List<Klinik> _temp = [];
                              for (Klinik item in _listKlinik!) {
                                if(item.getTreatment == "check up")
                                  _temp.add(item);
                              }
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ReservasiSearchPage(title: "Treatment - Checkup}", listKlinik: _temp,))
                              );
                            },
                            color: Colors.white,
                            width: screenSize.width/4,
                            height: screenSize.width/4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  child: Image.asset("assets/img/checkup.png", fit: BoxFit.fitWidth,)
                                ),
                                SizedBox(height: 10,),
                                Text("Checkup", style: TextStyle(color: tertiaryColor),)
                              ],
                            ),
                          ),
                          HETACard(
                            onTap: _listKlinik == null? (){} : (){
                              List<Klinik> _temp = [];
                              for (Klinik item in _listKlinik!) {
                                if(item.getTreatment == "vaccine")
                                  _temp.add(item);
                              }
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ReservasiSearchPage(title: "Treatment - Vaccine}", listKlinik: _temp,))
                              );
                            },
                            color: Colors.white,
                            width: screenSize.width/4,
                            height: screenSize.width/4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  child: Image.asset("assets/img/vaccine.png", fit: BoxFit.fitWidth,)
                                ),
                                SizedBox(height: 10,),
                                Text("vaccine", style: TextStyle(color: tertiaryColor),)
                              ],
                            ),
                          ),
                          HETACard(
                            onTap: _listKlinik == null? (){} : (){
                              List<Klinik> _temp = [];
                              for (Klinik item in _listKlinik!) {
                                if(item.getTreatment == "flea")
                                  _temp.add(item);
                              }
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ReservasiSearchPage(title: "Treatment - Flea}", listKlinik: _temp,))
                              );
                            },
                            color: Colors.white,
                            width: screenSize.width/4,
                            height: screenSize.width/4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  child: Image.asset("assets/img/flea.png", fit: BoxFit.fitWidth,)
                                ),
                                SizedBox(height: 10,),
                                Text("Flea", style: TextStyle(color: tertiaryColor),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HETACard(
                            onTap: _listKlinik == null? (){} : (){
                              List<Klinik> _temp = [];
                              for (Klinik item in _listKlinik!) {
                                if(item.getTreatment == "neuter")
                                  _temp.add(item);
                              }
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ReservasiSearchPage(title: "Treatment - Neuter}", listKlinik: _temp,))
                              );
                            },
                            color: Colors.white,
                            width: screenSize.width/4,
                            height: screenSize.width/4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  child: Image.asset("assets/img/neuter.png", fit: BoxFit.fitWidth,)
                                ),
                                SizedBox(height: 10,),
                                Text("Neuter", style: TextStyle(color: tertiaryColor),)
                              ],
                            ),
                          ),
                          SizedBox(width: 24,),
                          HETACard(
                            onTap: _listKlinik == null? (){} : (){
                              List<Klinik> _temp = [];
                              for (Klinik item in _listKlinik!) {
                                if(item.getTreatment == "spray")
                                  _temp.add(item);
                              }
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ReservasiSearchPage(title: "Treatment - Spray}", listKlinik: _temp,))
                              );
                            },
                            color: Colors.white,
                            width: screenSize.width/4,
                            height: screenSize.width/4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 42,
                                  child: Image.asset("assets/img/spray.png", fit: BoxFit.fitWidth,)
                                ),
                                SizedBox(height: 10,),
                                Text("Spray", style: TextStyle(color: tertiaryColor),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recommended for You", style: TextStyle(fontSize: 18, color: tertiaryColor),),
                      TextButton(
                        onPressed:_listKlinik == null? (){} : (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ReservasiSearchPage(listKlinik: _listKlinik,))
                          );
                        },
                        child: Text("See All", style: TextStyle(fontSize: 18, color: tertiaryColor),),
                      )
                    ],
                  ),
                ),
                _listKlinik == null
                ? Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: HETALoadingIndicator(),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _listKlinik!.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: HETACard(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ReservasiDetailPage(klinik: _listKlinik![index],))
                            );
                          },
                          width: screenSize.width,
                          height: 100,
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://img.freepik.com/free-vector/illustration-hospital_53876-81075.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle
                                ),
                              ),
                              SizedBox(width: 24,),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${_listKlinik![index].getName}", style: TextStyle(fontSize: 16, color: primaryColor),),
                                      SizedBox(height: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${_listKlinik![index].getAddress}", style: TextStyle(fontSize: 12)),
                                          Text("${_listKlinik![index].getDistance(0)} km", style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: HETACard(
                width: screenSize.width,
                height: 50,
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value){
                    setState(() {
                      _listKlinik = _listTempKlinik;
                    });
                    if(value.isNotEmpty){
                      List<Klinik> _temp = [];
                      for (var i = 0; i < _listKlinik!.length; i++) {
                        if(_listKlinik![i].getName!.toLowerCase().contains(value.toLowerCase())){
                          _temp.add(_listKlinik![i]);
                        }
                      }
                      setState(() {
                        _listKlinik = _temp;
                      });
                    } else {
                      _listKlinik = _listTempKlinik;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search for the best vet you need",
                    hintStyle: TextStyle(color: Color(0xFF9B9B9B)),
                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
                    prefixIcon: Icon(Icons.search)
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}