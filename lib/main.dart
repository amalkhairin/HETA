import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heta_app/model-logic/model/history/history_buymedicine.dart';
import 'package:heta_app/model-logic/model/history/history_reservasi.dart';
import 'package:heta_app/page-view/login_register/login_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future main() async {
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HistoryMedicineAdapter());
  Hive.registerAdapter(HistoryReservasiAdapter());
  Hive.openBox("histryReservasi");
  Hive.openBox("historyMedicine");
  
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
      home: LoginPage(),
    );
  }
}