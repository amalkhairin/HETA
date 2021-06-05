import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';

class DataNotFoundMessage extends StatelessWidget {
  final String header;
  final String title;
  final String subtitle;
  DataNotFoundMessage({this.header = "" ,this.title = "", this.subtitle = ""});
  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    
    return Center(
      child: Container(
        width: screenSize.width,
        height: screenSize.width,
        child: Column(
          children: [
            Container(
              width: 220,
              child: Text("$header", textAlign: TextAlign.center, style: TextStyle(color: tertiaryColor, fontSize: 24),)
            ),
            Container(
              height: 200,
              child: Image.asset("assets/img/not_found.png", fit: BoxFit.fitHeight,)
            ),
            title != "" 
            ? Container(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("$title", style: TextStyle(color: tertiaryColor, fontSize: 15),),
                  Text("$subtitle", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
                ],
              ),
            )
            : Text("$subtitle", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}