import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';

class HETALoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: Image.asset("assets/img/loading.gif", fit: BoxFit.fitWidth,),
        ),
        SizedBox(height: 24,),
        Text("Loading...", textAlign: TextAlign.center, style: TextStyle(color: primaryColor, fontSize: 18),)
      ],
    );
  }
}