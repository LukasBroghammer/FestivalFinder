import 'package:festival/Utils/FestivalItemDistance.dart';
import 'package:festival/blocs/widget_base_widget.dart';
import 'package:festival/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Utils/DatabaseService.dart';
import '../Utils/Destination.dart';
import '../Utils/FestivalItemDetails.dart';

class FestivalsWidget extends IbsStatelessWidget {
  double sliderValue = 50;
  double sliderValue2 = 250;
  late List<Destination> newdestinationsList = [];

  FestivalsWidget.state({Key? key, required Map<String, dynamic> state}) : super(key: key) {
    state = state;
    initState(state: state);
  }

  @override
  Widget buildWidget({BuildContext? context}) {
    filterList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.pink],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Festivals near you',
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        elevation: 7,
        toolbarHeight: 70,
      ),
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.red, Colors.pink],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Filter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 29, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                  ),
                  Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                    size: 29,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Set distance:',
                style: TextStyle(
                    color: Colors.pinkAccent, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.always,
              ),
              child: Slider(
                activeColor: Colors.pinkAccent,
                inactiveColor: Colors.black12,
                min: 0,
                max: 250,
                value: sliderValue,
                label: sliderValue.round().toString(),
                onChanged: (newValue) {
                  //setState(() => sliderValue = newValue);
                  sliderValue = newValue;
                  oDB.blocs["FestivalsWidget"]!.update();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Set price:',
                style: TextStyle(
                    color: Colors.pinkAccent, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.always,
              ),
              child: Slider(
                activeColor: Colors.pinkAccent,
                inactiveColor: Colors.black12,
                min: 0,
                max: 250,
                value: sliderValue2,
                label: sliderValue2.round().toString(),
                onChanged: (newValue) {
                  //setState(() => sliderValue = newValue);
                  sliderValue2 = newValue;
                  oDB.blocs["FestivalsWidget"]!.update();
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Container(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: newdestinationsList.length,

              physics: ScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemBuilder: (context, index) => GestureDetector(
                child: FestivalItemDistance(newdestinationsList[index]),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FestivalItemDetails(newdestinationsList[index])));
                },
              ),
              staggeredTileBuilder: (index) => StaggeredTile.count((index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
            ),
          ),
        ),
      ),
    );
  }

  ///Function
  filterList() {
    for (var i = 0; i < oDB.destinationsList.length; i++) {
      if (oDB.destinationsList.elementAt(i).distance <= sliderValue&&
          newdestinationsList.contains(oDB.destinationsList.elementAt(i)) == false &&
          oDB.destinationsList.elementAt(i).price <= sliderValue2) {
        newdestinationsList.add(oDB.destinationsList.elementAt(i));
      } else {
        print('not near');
      }
    }
    for (var i = 0; i < newdestinationsList.length; i++) {
      if (newdestinationsList.elementAt(i).distance >= sliderValue || newdestinationsList.elementAt(i).price > sliderValue2) {
        newdestinationsList.removeAt(i);
      }
    }
    return newdestinationsList;
  }
}
