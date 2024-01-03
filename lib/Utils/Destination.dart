

import 'package:flutter/cupertino.dart';


class Destination {
  final String name;
  final double lat;
  final double long;
        double distance;
  final String imgURl;
  final String genre;
  final int price;

  Destination({
    required this.name,
    required this.lat,
    required this.long,
    required this.distance,
    required this.imgURl,
    required this.genre,
    required this.price
});


  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
    name: (json['name']! as String),
    lat: (json['lat']! as double),
    long: (json['long']! as double),
    distance: (json['distance']! as double),
    imgURl: (json['imgURL']! as String),
    price: (json['price']! as int),
    genre: (json['genre']! as String)

    );
  }

  Map<String, Object?> toJson(){
    return {
      'name' : name,
      'lat'  : lat,
      'long' : long,
      'distance' : distance,

    };
  }



}
