import 'package:flutter/material.dart';
import 'package:heta_app/components/data_not_found.dart';
import 'package:heta_app/components/heta_card.dart';
import 'package:heta_app/components/heta_loading_indicator.dart.dart';
import 'package:heta_app/constant/color.dart';

class HistoryBuyMedicinePage extends StatefulWidget {
  @override
  _HistoryBuyMedicinePageState createState() => _HistoryBuyMedicinePageState();
}

class _HistoryBuyMedicinePageState extends State<HistoryBuyMedicinePage> {
  List _listHistoryBuyMedicine = ["1"];
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    
    if(_isLoading) {
      return Center(
        child: HETALoadingIndicator(),
      );
    } else {
      return Container(
        color: backgroundColor,
        child: _listHistoryBuyMedicine.isNotEmpty
        ? ListView.builder(
          itemCount: _listHistoryBuyMedicine.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
              child: HETACard(
                width: screenSize.width,
                height: 100,
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
                            Text("Transaction Number: 00113345", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text("Kost Wisma Darul Ilmi", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400)),
                            Text("2 items", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w300)),
                            Text("Gopay", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w300)),
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
          subtitle: "Let's buy some medicine for your lovely pet",
        )
      );
    }
  }
}