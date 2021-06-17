import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/model-logic/model/articles/article.dart';

class ArticlesPage extends StatelessWidget {
  final Article? article;
  ArticlesPage({this.article});
  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: primaryColor,),
        ),
        title: Text("Article", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Text("${article!.getTitle}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${article!.getPublisher}", style: TextStyle(fontSize: 12)),
                  Text("${article!.getDate}", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Container(
                width: screenSize.width,
                height: screenSize.width/1.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article!.getPhoto!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6)
                ),
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Text( "${article!.getContent}", style: TextStyle(fontSize: 16), ),
            )
          ],
        ),
      ),
    );
  }
}