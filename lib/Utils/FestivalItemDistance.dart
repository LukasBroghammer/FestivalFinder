import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Destination.dart';

class FestivalItemDistance extends StatelessWidget {

  final Destination destination;

  FestivalItemDistance(this.destination);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 200,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: NetworkImage(destination.imgURl),
              fit: BoxFit.cover
          )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(destination.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ) ,
            ),
            Text('${destination.distance.toStringAsFixed(2)}km',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            )

          ],
        ),
      ),
    );
  }


}