import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'Destination.dart';

class FestivalItemDetails extends StatelessWidget {

  final Destination destination;

  FestivalItemDetails(this.destination);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage(destination.imgURl),
                      fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight:Radius.circular(20) ,topLeft:Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.red,Colors.pink],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                ),
                child: Text(destination.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:30,
                    fontWeight: FontWeight.bold,
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight:Radius.circular(20),topLeft:Radius.circular(20)),
                          gradient: LinearGradient(
                            colors: [Colors.red,Colors.pink],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          )
                      ),
                      child: Column(
                          children:[
                            Icon(
                              Icons.music_note,
                              color: Colors.white,
                            ),
                            Text('Genre  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(destination.genre,
                                  style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  )
                              ),
                            )
                          ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight:Radius.circular(20),topLeft:Radius.circular(20)),
                                gradient: LinearGradient(
                                  colors: [Colors.red,Colors.pink],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                )
                            ),
                            child: Column(
                                children:[
                                  Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                  ),
                                  Text('Price  ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(destination.price.toString(),
                                        style:TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                        )
                                    ),
                                  )
                                ]
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight:Radius.circular(20),topLeft:Radius.circular(20)),
                                gradient: LinearGradient(
                                  colors: [Colors.red,Colors.pink],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                )
                            ),
                            child: Column(
                                children:[
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                  Text('Date  ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(destination.price.toString(),
                                        style:TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700
                                        )
                                    ),
                                  )
                                ]
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight:Radius.circular(20),topLeft:Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [Colors.red,Colors.pink],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        )
                    ),
                    child: Column(
                        children:[
                          Icon(
                            Icons.route,
                            color: Colors.white,
                          ),
                          Text('Distance  ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(destination.distance.toStringAsFixed(2),
                                style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                )
                            ),
                          )
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight:Radius.circular(20),topLeft:Radius.circular(20)),
                              gradient: LinearGradient(
                                colors: [Colors.red,Colors.pink],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              )
                          ),
                          child: Column(
                              children:[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text('Location  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    )
                                ),
                                IconButton(
                                    color: Colors.white,
                                    splashColor: Colors.white,
                                    disabledColor: Colors.white,
                                    onPressed: (){
                                      showGoogleMaps();
                                    },
                                    icon: Icon(Icons.map)
                                )
                              ]
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  //Functions
  showGoogleMaps() async{
    String googleURL = "https://www.google.com/maps/search/?api=1&query=${destination.lat},${destination.long}";

    if (await canLaunchUrlString(googleURL)) {
    await launchUrlString(googleURL);
    } else
    throw ("Failed");
  }


}