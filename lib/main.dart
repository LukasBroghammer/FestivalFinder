import 'package:festival/pages/FestivalSearch.dart';
import 'package:festival/pages/HomePage.dart';
import 'package:festival/provider/location_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  location.currentPosition = null;

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final screens = [
    HomePageWidget.state(
      state: const {"uuid": "HomePageWidget"},
    ),
    FestivalsWidget.state(
      state: const {"uuid": "FestivalsWidget"},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Stack(children: [
          Container(
            // this is the decoration of the container for gradient look
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  Colors.pink,
                ],
              ),
            ),
            // i have found out the height of the bottom navigation bar is roughly 60
            height: 70,
          ),
          BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedFontSize: 20,
            unselectedFontSize: 16,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'Location search',
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
