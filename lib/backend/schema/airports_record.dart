import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AirportsRecord extends FirestoreRecord {
  AirportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "airport_code" field.
  String? _airportCode;
  String get airportCode => _airportCode ?? '';
  bool hasAirportCode() => _airportCode != null;

  // "code_icao" field.
  String? _codeIcao;
  String get codeIcao => _codeIcao ?? '';
  bool hasCodeIcao() => _codeIcao != null;

  // "code_iata" field.
  String? _codeIata;
  String get codeIata => _codeIata ?? '';
  bool hasCodeIata() => _codeIata != null;

  // "code_lid" field.
  String? _codeLid;
  String get codeLid => _codeLid ?? '';
  bool hasCodeLid() => _codeLid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "elevation" field.
  double? _elevation;
  double get elevation => _elevation ?? 0.0;
  bool hasElevation() => _elevation != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  bool hasTimezone() => _timezone != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "wiki_url" field.
  String? _wikiUrl;
  String get wikiUrl => _wikiUrl ?? '';
  bool hasWikiUrl() => _wikiUrl != null;

  void _initializeFields() {
    _airportCode = snapshotData['airport_code'] as String?;
    _codeIcao = snapshotData['code_icao'] as String?;
    _codeIata = snapshotData['code_iata'] as String?;
    _codeLid = snapshotData['code_lid'] as String?;
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] as String?;
    _elevation = castToType<double>(snapshotData['elevation']);
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _longitude = castToType<double>(snapshotData['longitude']);
    _latitude = castToType<double>(snapshotData['latitude']);
    _timezone = snapshotData['timezone'] as String?;
    _countryCode = snapshotData['country_code'] as String?;
    _wikiUrl = snapshotData['wiki_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('airports');

  static Stream<AirportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AirportsRecord.fromSnapshot(s));

  static Future<AirportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AirportsRecord.fromSnapshot(s));

  static AirportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AirportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AirportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AirportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AirportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AirportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAirportsRecordData({
  String? airportCode,
  String? codeIcao,
  String? codeIata,
  String? codeLid,
  String? name,
  String? type,
  double? elevation,
  String? city,
  String? state,
  double? longitude,
  double? latitude,
  String? timezone,
  String? countryCode,
  String? wikiUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'airport_code': airportCode,
      'code_icao': codeIcao,
      'code_iata': codeIata,
      'code_lid': codeLid,
      'name': name,
      'type': type,
      'elevation': elevation,
      'city': city,
      'state': state,
      'longitude': longitude,
      'latitude': latitude,
      'timezone': timezone,
      'country_code': countryCode,
      'wiki_url': wikiUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class AirportsRecordDocumentEquality implements Equality<AirportsRecord> {
  const AirportsRecordDocumentEquality();

  @override
  bool equals(AirportsRecord? e1, AirportsRecord? e2) {
    return e1?.airportCode == e2?.airportCode &&
        e1?.codeIcao == e2?.codeIcao &&
        e1?.codeIata == e2?.codeIata &&
        e1?.codeLid == e2?.codeLid &&
        e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.elevation == e2?.elevation &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.longitude == e2?.longitude &&
        e1?.latitude == e2?.latitude &&
        e1?.timezone == e2?.timezone &&
        e1?.countryCode == e2?.countryCode &&
        e1?.wikiUrl == e2?.wikiUrl;
  }

  @override
  int hash(AirportsRecord? e) => const ListEquality().hash([
        e?.airportCode,
        e?.codeIcao,
        e?.codeIata,
        e?.codeLid,
        e?.name,
        e?.type,
        e?.elevation,
        e?.city,
        e?.state,
        e?.longitude,
        e?.latitude,
        e?.timezone,
        e?.countryCode,
        e?.wikiUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is AirportsRecord;
}
