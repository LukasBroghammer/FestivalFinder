import 'package:flutter/material.dart';

import 'package:festival/blocs/widget_base_widget.dart';

import 'package:festival/Utils/DatabaseService.dart';
import 'package:festival/Utils/FestivalItem.dart';
import 'package:festival/Utils/FestivalItemDetails.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Utils/Destination.dart';

class HomePageWidget extends IbsStatelessWidget {
  HomePageWidget.state({Key? key, required Map<String, dynamic> state}) : super(key: key) {
    state = state;
    initState(state: state);
    oDB.getDestinations();
  }

  @override
  Widget buildWidget({BuildContext? context}) {
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
            ),
          ),
        ),
        title: Text(
          'Festivals',
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
          textAlign: TextAlign.center,
        ),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 7,
        shadowColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Container(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: oDB.destinationsList.length,
              physics: ScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemBuilder: (context, index) => GestureDetector(
                  child: FestivalItem(oDB.destinationsList[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FestivalItemDetails(oDB.destinationsList[index]),
                      ),
                    );
                  }),
              staggeredTileBuilder: (index) => StaggeredTile.count((index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
            ),
          ),
        ),
      ),
    );
  }
}
