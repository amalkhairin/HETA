import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';

class Articles extends StatelessWidget {
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
              child: Text("Penjelasan 16 Sifat Aneh Kucing Secara Ilmiah", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("IDN Times", style: TextStyle(fontSize: 12)),
                  Text("16 Juni 2019", style: TextStyle(fontSize: 12)),
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
                    image: NetworkImage("https://www.nespthreatenedspecies.edu.au/media/dzhnixjo/cat-outside_credit-rotiv-artic-unsplash.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6)
                ),
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Text(
                "Proses perkembangbiakan dari anjing membuat kita jadi mengenal banyak tipe anjing yang berbeda. Mulai dari warna, bentuk, ukuran, bulu, dan juga karakter fisik. Ternyata, jumlah perkembangbiakan anjing ini lebih banyak dari mamalia lainnya. Ternyata ada lebih dari 400 ras anjing di dunia. Diperkirakan jumlah ini terus bertambah.",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}