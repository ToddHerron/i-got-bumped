import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountriesRecord extends FirestoreRecord {
  CountriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CountryName" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "LanguageCode" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  bool hasLanguageCode() => _languageCode != null;

  // "docTitle" field.
  String? _docTitle;
  String get docTitle => _docTitle ?? '';
  bool hasDocTitle() => _docTitle != null;

  // "BillOfRightsURL" field.
  String? _billOfRightsURL;
  String get billOfRightsURL => _billOfRightsURL ?? '';
  bool hasBillOfRightsURL() => _billOfRightsURL != null;

  void _initializeFields() {
    _countryName = snapshotData['CountryName'] as String?;
    _languageCode = snapshotData['LanguageCode'] as String?;
    _docTitle = snapshotData['docTitle'] as String?;
    _billOfRightsURL = snapshotData['BillOfRightsURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countries');

  static Stream<CountriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountriesRecord.fromSnapshot(s));

  static Future<CountriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountriesRecord.fromSnapshot(s));

  static CountriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountriesRecordData({
  String? countryName,
  String? languageCode,
  String? docTitle,
  String? billOfRightsURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CountryName': countryName,
      'LanguageCode': languageCode,
      'docTitle': docTitle,
      'BillOfRightsURL': billOfRightsURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountriesRecordDocumentEquality implements Equality<CountriesRecord> {
  const CountriesRecordDocumentEquality();

  @override
  bool equals(CountriesRecord? e1, CountriesRecord? e2) {
    return e1?.countryName == e2?.countryName &&
        e1?.languageCode == e2?.languageCode &&
        e1?.docTitle == e2?.docTitle &&
        e1?.billOfRightsURL == e2?.billOfRightsURL;
  }

  @override
  int hash(CountriesRecord? e) => const ListEquality()
      .hash([e?.countryName, e?.languageCode, e?.docTitle, e?.billOfRightsURL]);

  @override
  bool isValidKey(Object? o) => o is CountriesRecord;
}
