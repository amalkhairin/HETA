import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';

class ReservasiSearch extends StatefulWidget {
  final Widget? title;
  ReservasiSearch({this.title});
  @override
  _ReservasiSearchState createState() => _ReservasiSearchState();
}

class _ReservasiSearchState extends State<ReservasiSearch> {
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
        title: Text("Recomended for You", style: TextStyle(color: primaryColor),),
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
          itemCount: 10,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.fromLTRB(24, (index == 0? 24 : 8), 24, (index == 9? 24 : 8)),
              child: HETACard(
                onTap: (){},
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
                          image: NetworkImage("https://www.nespthreatenedspecies.edu.au/media/dzhnixjo/cat-outside_credit-rotiv-artic-unsplash.jpg"),
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
                            Text("UPT Klink Hewan Bandung", style: TextStyle(fontSize: 16, color: primaryColor),),
                            SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Buah batu", style: TextStyle(fontSize: 12)),
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