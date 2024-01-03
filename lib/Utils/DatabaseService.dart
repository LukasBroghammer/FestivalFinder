import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/Utils/Destination.dart';
import 'package:festival/blocs/widget_bloc.dart';
import 'package:geolocator/geolocator.dart';

/// Again, application-level global variable
DatabaseService oDB = new DatabaseService();

class DatabaseService {
  static final DatabaseService _oDB = new DatabaseService._internal();

  // the list of events
  List<Destination> destinationsList = [];

  ///-------------------------------------------------------------------------------------------------------------------
  /// the reference list of blocs holds the business logic of type IbsWidgetBloc of every widget
  /// {"uuid": string, "bloc": IbsWidgetBloc} again identified by the same uuid. the bloc is created
  /// and attached to the list on creation of the widget. through the blocs, the widgets are updated.
  ///-------------------------------------------------------------------------------------------------------------------
  Map<String, IbsWidgetBloc> blocs = {};

  /// create Database
  factory DatabaseService() {
    return _oDB;
  }

  /// initialize properties
  DatabaseService._internal() {}

  //Convert Future list to list
  Future<void> convertList() async {
    Future<List<Destination>> newDestinations = DatabaseService().getDestinations();
    Future<List> _futureOfList = newDestinations;
    List _destinations = await _futureOfList;
    print(_destinations);
    destinationsList = _destinations.cast<Destination>();
  }

  //Calculate distance between user location and festival location
  distanceCalculator(Position position) async {
    for (var i = 0; i < oDB.destinationsList.length; i++) {
      var m = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        oDB.destinationsList.elementAt(i).lat,
        oDB.destinationsList.elementAt(i).long,
      );

      var d = m / 1000;
      oDB.destinationsList.elementAt(i).distance = d;
    }
    oDB.destinationsList.sort((a, b) {
      return a.distance.compareTo(b.distance);
    });
    return oDB.destinationsList;
  }

  //A reference to the List of Destinations
  final destinationRef = FirebaseFirestore.instance.collection('festivals').withConverter<Destination>(
        fromFirestore: (snapshot, _) => Destination.fromJson(snapshot.data()!),
        toFirestore: (destination, _) => destination.toJson(),
      );

  //Get Data in a List
  Future<List<Destination>> getDestinations() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('festivals').get();
    List<QueryDocumentSnapshot> docs = querySnapshot.docs;
    final destinationList = docs.map((doc) => Destination.fromJson(doc.data() as Map<String, dynamic>)).toList();
    return destinationList;
  }
}
