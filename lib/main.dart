import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heta_app/page-view/history/history_main.dart';
import 'package:heta_app/page-view/home.dart';
import 'package:heta_app/page-view/login_register/login.dart';
import 'package:heta_app/page-view/reservasi/reservasi_accepted.dart';
import 'package:heta_app/page-view/reservasi/reservasi_detail.dart';
import 'package:heta_app/page-view/reservasi/reservasi_main.dart';

import 'page-view/reservasi/reservasi_search.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'HETA App',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}