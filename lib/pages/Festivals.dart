import 'package:flutter/material.dart';

import 'package:festival/Utils/DatabaseService.dart';
import 'package:festival/blocs/widget_base_widget.dart';

// ignore: must_be_immutable
class Festivals extends IbsStatelessWidget {
  Festivals.state({Key? key, required Map<String, dynamic> state}) : super(key: key) {
    state = state;
    initState(state: state);
  }

  @override
  Widget buildWidget({BuildContext? context}) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Festivals near your location"),
      ),
      body: Container(
        child: oDB.destinationsList.isNotEmpty
            ? ListView.builder(
                itemCount: oDB.destinationsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(5),
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: 60,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(oDB.destinationsList[index].name),
                            Text("${oDB.destinationsList[index].distance.toStringAsFixed(2)} km"),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
