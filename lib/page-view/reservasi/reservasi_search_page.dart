import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/model/klinik/klinik.dart';
import 'package:heta_app/page-view/reservasi/reservasi_detail_page.dart';

class ReservasiSearchPage extends StatefulWidget {
  final String? title;
  final List<Klinik>? listKlinik;
  ReservasiSearchPage({this.title = "Recomended for You", this.listKlinik});
  @override
  _ReservasiSearchPageState createState() => _ReservasiSearchPageState();
}

class _ReservasiSearchPageState extends State<ReservasiSearchPage> {
  List<Klinik> _listTemp = [];

  setList(){
    setState(() {
      _listTemp = widget.listKlinik!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setList();
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
        title: Text("${widget.title}", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        actions: [],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
            child: HETACard(
              width: screenSize.width,
              height: 50,
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    _listTemp = widget.listKlinik!;
                  });
                  if(value.isNotEmpty){
                    List<Klinik> _temp = [];
                    for (var i = 0; i < _listTemp.length; i++) {
                      if(_listTemp[i].getName!.toLowerCase().contains(value.toLowerCase())){
                        _temp.add(_listTemp[i]);
                      }
                    }
                    setState(() {
                      _listTemp = _temp;
                    });
                  } else {
                    _listTemp = widget.listKlinik!;
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
        ),
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _listTemp.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.fromLTRB(24, (index == 0? 24 : 8), 24, (index == 9? 24 : 8)),
              child: HETACard(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReservasiDetailPage(klinik: _listTemp[index],))
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
                            Text("${_listTemp[index].getName}", style: TextStyle(fontSize: 16, color: primaryColor),),
                            SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${_listTemp[index].getAddress}", style: TextStyle(fontSize: 12)),
                                Text("2.5 km", style: TextStyle(fontSize: 12)),
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
      ),
    );
  }
}