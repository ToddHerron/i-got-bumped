import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? convertLangNameListToLangCodeList(
  List<String>? langNamesList,
  String userLanguageCode,
) {
  List<String>? langCodesList = [];

  if (langNamesList == null) {
    return [];
  }
  ;

  if (userLanguageCode == 'en' &&
      (langNamesList.contains('English') ||
          langNamesList.contains('Anglais') ||
          langNamesList.contains('Inglés') ||
          langNamesList.contains('Englisch') ||
          langNamesList.contains('英语'))) {
    langCodesList.add('en');
  }
  ;

  if (userLanguageCode == 'en' &&
      (langNamesList.contains('French') ||
          langNamesList.contains('Français') ||
          langNamesList.contains('Francés') ||
          langNamesList.contains('Französisch') ||
          langNamesList.contains('法语'))) {
    langCodesList.add('fr');
  }
  ;

  return langCodesList;
}

DocumentReference getAirportsDocReference(String airportCode) {
  final firestoreDB = FirebaseFirestore.instance;
  return firestoreDB.doc('/airports/${airportCode}');
}
