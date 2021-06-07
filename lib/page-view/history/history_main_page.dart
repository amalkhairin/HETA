import 'package:flutter/material.dart';
import 'package:heta_app/constant/color.dart';
import 'package:heta_app/page-view/history/history_buy_medicine_page.dart';
import 'package:heta_app/page-view/history/history_reservasi_page.dart';

class HistoryMain extends StatefulWidget {
  @override
  _HistoryMainState createState() => _HistoryMainState();
}

class _HistoryMainState extends State<HistoryMain> with TickerProviderStateMixin{
  TabController? _tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: primaryColor,),
        ),
        title: Text("History", style: TextStyle(color: primaryColor),),
        centerTitle: true,
        actions: [],
        backgroundColor: backgroundColor,
        elevation: 2.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(42),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelColor: tertiaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.all(8),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFE5E5E5).withOpacity(0.5),
              ),
              isScrollable: true,
              tabs: [
                Tab(text: "Reservation",),
                Tab(text: "Buy Medicine",),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            HistoryReservasi(),
            HistoryBuyMedicine(),
          ],
        )
      ),
    );
  }
}