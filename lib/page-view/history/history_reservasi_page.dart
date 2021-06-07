import 'package:flutter/material.dart';
import 'package:heta_app/components/data_not_found.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/constant/color.dart';

class HistoryReservasi extends StatefulWidget {
  @override
  _HistoryReservasiState createState() => _HistoryReservasiState();
}

class _HistoryReservasiState extends State<HistoryReservasi> {
  List _listHistoryReservasi = ["1"];

  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Container(
      color: backgroundColor,
      child: _listHistoryReservasi.isNotEmpty
      ? ListView.builder(
        itemCount: _listHistoryReservasi.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
            child: HETACard(
              width: screenSize.width,
              height: 136,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenSize.width/2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Reservation Number: 00113345", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("UPT Klinik Hewan Bandung", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                          Text("Buah Batu", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: primaryColor, fontWeight: FontWeight.w300)),
                          SizedBox(height: 6,),
                          Text("Drh. Franco", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                          Text("Time: 14.00", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Text("Mar 30, 2020", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
          );
        },
      )
      : DataNotFoundMessage(
        title: "Hmm.. Seems like nothing here",
        subtitle: "Let's reserve the best vet in town for your pet",
      )
    );
  }
}