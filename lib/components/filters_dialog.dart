import 'package:flutter/material.dart';

class FiltersDialog extends StatefulWidget {
  final List? filterList;
  final List? selectedFilters;
  FiltersDialog({this.filterList, this.selectedFilters});
  @override
  _FiltersDialogState createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<FiltersDialog> {
  List _filterList = [];
  List _selectedFilters = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _filterList = widget.filterList!;
    _selectedFilters = widget.selectedFilters!;
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Container(
      height: 100,
      width: screenSize.width,
      child: GridView.builder(
        itemCount: _filterList.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              setState(() {
                if(_selectedFilters.contains("${_filterList[index]}")){
                  _selectedFilters.remove("${_filterList[index]}");
                } else {
                  _selectedFilters.add("${_filterList[index]}");
                }
              });
            },
            child: Card(
              elevation: _selectedFilters.contains("${_filterList[index]}")? 0.0 : 1.0,
              color: _selectedFilters.contains("${_filterList[index]}")? Colors.blue[50] : Colors.white,
              child: Center(child: Text("${_filterList[index]}")),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 42,
        ),
      ),
    );
  }
}