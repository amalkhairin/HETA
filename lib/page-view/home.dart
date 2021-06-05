import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/page-view/articles/articles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/img/logo.png", fit: BoxFit.fitWidth,),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Icon(Icons.history, color: primaryColor, size: 42,)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Text("Hi Amal!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 14),
                  child: Text("Our Services", style: TextStyle(fontWeight: FontWeight.w700),),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HETACard(
                        onTap: (){},
                        color: Colors.white,
                        width: screenSize.width/2.5,
                        height: screenSize.width/2.5,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                child: Image.asset("assets/img/reservasi.png", fit: BoxFit.fitWidth,)
                              ),
                              SizedBox(height: 10,),
                              Text("Reservastion", style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                      ),
                      HETACard(
                        onTap: (){},
                        color: Colors.white,
                        width: screenSize.width/2.5,
                        height: screenSize.width/2.5,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                child: Image.asset("assets/img/buy_medicine.png", fit: BoxFit.fitWidth,)
                              ),
                              SizedBox(height: 10,),
                              Text("Buy Medicine", style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 14),
                  child: Text("Articles", style: TextStyle(fontWeight: FontWeight.w700),),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Articles())
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://www.nespthreatenedspecies.edu.au/media/dzhnixjo/cat-outside_credit-rotiv-artic-unsplash.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(6)
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Penjelasan 16 Sifat Aneh Kucing Secara Ilmiah", style: TextStyle(fontSize: 16),),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("IDN Times", style: TextStyle(fontSize: 12)),
                                        Text("16 Juni 2019", style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}