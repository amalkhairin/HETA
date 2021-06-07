import 'package:flutter/material.dart';
import 'package:heta_app/components/dashed_line.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/page-view/home_page.dart';

class ReservasiAccepted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Set Appointment", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: HETACard(
                color: backgroundColor,
                width: screenSize.width,
                height: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, size: 100, color: greenColor,),
                    Text("Appointment Accepted", style: TextStyle(color: greenColor, fontSize: 28, fontWeight: FontWeight.w500),),
                    Text("Reservastion Number: 00113345", style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: DashedLine(color: Colors.grey[300], height: 2,),
                    ),
                    Column(
                      children: [
                        Text("UPT Klinik Hewan Bandung", style: TextStyle(color: greenColor, fontSize: 18)),
                        Text("Drh. Tirta Wijaya", style: TextStyle(color: greenColor, fontSize: 14)),
                        Text("Monday, 30 March | 14.00", style: TextStyle(color: greenColor, fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 42,),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    onPrimary: Colors.white,
                    elevation: 0
                  ),
                  child: Text("Home Page"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}