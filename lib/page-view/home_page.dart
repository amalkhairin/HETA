import 'package:flutter/material.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/components/heta_loading_indicator.dart.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/logic/db.dart';
import 'package:heta_app/model-logic/model/articles/article.dart';
import 'package:heta_app/model-logic/model/pemilik_hewan/pemilik_hewan.dart';
import 'package:heta_app/page-view/articles/articles_page.dart';
import 'package:heta_app/page-view/buy_medicine/buy_medicine_main_page.dart';
import 'package:heta_app/page-view/history/history_main_page.dart';
import 'package:heta_app/page-view/login_register/login_page.dart';
import 'package:heta_app/page-view/reservasi/reservasi_main_page.dart';
import 'package:heta_app/utility/log.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article>? _listArticle;
  Database _db = Database();
  String _username = "...";
  PemilikHewan _user = PemilikHewan.instance;
  final _key = GlobalKey();
  
  loadArticle() async {
    List<Article>? _temp = [];
    var res = await _db.getAllArticle();
    if(res != false){
      for (var i = 0; i < res.length; i++) {
        _temp.add(Article.fromJson(res[i]));
      }
      setState(() {
        _listArticle = _temp;
      });
    }
  }

  loadUsername() async {
    String username = await Log.getString("username");
    setState(() {
      _username = username;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadArticle();

  }
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
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => HistoryMainPage())
                              );
                            },
                            child: Icon(Icons.history, color: primaryColor, size: 42,)
                          ),
                          PopupMenuButton(
                            onSelected: (value){
                              if(value == "logout"){
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text("Are you sure want to log out?"),
                                      actions: [
                                        TextButton(
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: (){
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context)=> LoginPage())
                                            );
                                          },
                                          child: Text("Ok"),
                                        ),
                                      ]
                                    );
                                  }
                                );
                              }
                            },
                            child: Icon(Icons.more_vert, color: primaryColor, size: 42,),
                            itemBuilder: (context) => <PopupMenuEntry<String>>[
                              PopupMenuItem(
                                value: "logout",
                                child: Text("Logout"),
                              ),
                            ],
                          ),
                          // InkWell(
                          //   onTap: (){
                              
                          //   },
                          //   child: Icon(Icons.more_vert, color: primaryColor, size: 42,)
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Text("Hi ${_user.username}!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
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
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ReservasiMainPage())
                          );
                        },
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
                              Text("Reservation", style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                      ),
                      HETACard(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => BuyMedicineMainPage())
                          );
                        },
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
                _listArticle == null
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: HETALoadingIndicator(),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _listArticle!.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ArticlesPage(article: _listArticle![index],))
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
                                    image: NetworkImage(_listArticle![index].getPhoto!),
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
                                      Text("${_listArticle![index].getTitle!}", style: TextStyle(fontSize: 16),),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${_listArticle![index].getPublisher}", style: TextStyle(fontSize: 12)),
                                          Text("${_listArticle![index].getDate}", style: TextStyle(fontSize: 12)),
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
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}