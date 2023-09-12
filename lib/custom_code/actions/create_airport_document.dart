// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> createAirportDocument(
  String? airportCode,
  String? codeICAO,
  String? codeIATA,
  String? codeLID,
  String? name,
  String? type,
  double? elevation,
  String? city,
  String? state,
  double? longitude,
  double? latitude,
  String? timezone,
  String? countryCode,
  String? wikiURL,
  String? airportFlightsURL,
) async {
  try {
    final firestoreDB = FirebaseFirestore.instance;

    firestoreDB.collection("airports").doc(codeICAO).set({
      "airport_code": airportCode,
      "code_icao": codeICAO,
      "code_iata": codeIATA,
      "code_lid": codeLID,
      "name": name,
      "type": type,
      "elevation": elevation,
      "city": city,
      "state": state,
      "longitude": longitude,
      "latitude": latitude,
      "timezone": timezone,
      "country_code": countryCode,
      "wiki_url": wikiURL,
      "airport_flights_url": airportFlightsURL,
      "alternatives": [],
    });

    return "Success";
  } catch (e) {
    return e.toString();
  }
}
