import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/constant/style.dart';

class ReservasiMain extends StatefulWidget {
  @override
  _ReservasiMainState createState() => _ReservasiMainState();
}

class _ReservasiMainState extends State<ReservasiMain> {
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
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(64),
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
        //     child: TextFormField(
        //       decoration: InputDecoration(
        //         filled: true,
        //         fillColor: Color(0xFFF6F6F6),
        //         hintText: "Search for the best vet you need",
        //         hintStyle: TextStyle(color: Color(0xFF9B9B9B)),
        //         border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
        //         prefixIcon: Icon(Icons.search)
        //       ),
        //     ),
        //   ),
        // ),
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
                            onTap: (){},
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
                            onTap: (){},
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
                            onTap: (){},
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
                            onTap: (){},
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
                            onTap: (){},
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
                        onPressed: (){},
                        child: Text("See All", style: TextStyle(fontSize: 18, color: tertiaryColor),),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
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
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
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
          ],
        )
      ),
    );
  }
}