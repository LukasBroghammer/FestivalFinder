import 'dart:async';

import 'package:festival/Utils/DatabaseService.dart';
import 'package:geolocator/geolocator.dart';

/// Application-level global variable to access the Localization
Location location = new Location();

class Location {
  ///
  static final Location _location = new Location._internal();
  // the current geo location position
  Position? currentPosition;

  StreamSubscription<Position>? positionStream;

  ///
  factory Location() {
    return _location;
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _updatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  ///-------------------------------------------------------------------------------------------------------------------
  /// Kann aufgerufen werden um die Position manuell zu aktualisieren.
  ///-------------------------------------------------------------------------------------------------------------------
  Future<void> updatePosition() async {
    _updatePosition().then((position) {
      currentPosition = position;

      oDB.convertList().then((value) {
        if (currentPosition != null) {
          oDB.distanceCalculator(location.currentPosition!);
        }
      });
    });
  }

  ///-------------------------------------------------------------------------------------------------------------------
  /// Initialisierung
  ///-------------------------------------------------------------------------------------------------------------------
  Location._internal() {
    _updatePosition().then((position) => currentPosition = position);

    positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    ).listen(
      (Position? position) {
        currentPosition = position;

        oDB.convertList().then((value) {
          if (currentPosition != null) {
            oDB.distanceCalculator(location.currentPosition!);
            oDB.blocs["HomePageWidget"]!.update();
            oDB.blocs["FestivalsWidget"]!.update();
          }
        });

        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
      },
    );
  }
}
