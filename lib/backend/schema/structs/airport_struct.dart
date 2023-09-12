// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AirportStruct extends FFFirebaseStruct {
  AirportStruct({
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
    String? airportFlightsUrl,
    List<AirportStruct>? alternatives,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _airportCode = airportCode,
        _codeIcao = codeIcao,
        _codeIata = codeIata,
        _codeLid = codeLid,
        _name = name,
        _type = type,
        _elevation = elevation,
        _city = city,
        _state = state,
        _longitude = longitude,
        _latitude = latitude,
        _timezone = timezone,
        _countryCode = countryCode,
        _wikiUrl = wikiUrl,
        _airportFlightsUrl = airportFlightsUrl,
        _alternatives = alternatives,
        super(firestoreUtilData);

  // "airport_code" field.
  String? _airportCode;
  String get airportCode => _airportCode ?? '';
  set airportCode(String? val) => _airportCode = val;
  bool hasAirportCode() => _airportCode != null;

  // "code_icao" field.
  String? _codeIcao;
  String get codeIcao => _codeIcao ?? '';
  set codeIcao(String? val) => _codeIcao = val;
  bool hasCodeIcao() => _codeIcao != null;

  // "code_iata" field.
  String? _codeIata;
  String get codeIata => _codeIata ?? '';
  set codeIata(String? val) => _codeIata = val;
  bool hasCodeIata() => _codeIata != null;

  // "code_lid" field.
  String? _codeLid;
  String get codeLid => _codeLid ?? '';
  set codeLid(String? val) => _codeLid = val;
  bool hasCodeLid() => _codeLid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "elevation" field.
  double? _elevation;
  double get elevation => _elevation ?? 0.0;
  set elevation(double? val) => _elevation = val;
  void incrementElevation(double amount) => _elevation = elevation + amount;
  bool hasElevation() => _elevation != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  set timezone(String? val) => _timezone = val;
  bool hasTimezone() => _timezone != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  set countryCode(String? val) => _countryCode = val;
  bool hasCountryCode() => _countryCode != null;

  // "wiki_url" field.
  String? _wikiUrl;
  String get wikiUrl => _wikiUrl ?? '';
  set wikiUrl(String? val) => _wikiUrl = val;
  bool hasWikiUrl() => _wikiUrl != null;

  // "airport_flights_url" field.
  String? _airportFlightsUrl;
  String get airportFlightsUrl => _airportFlightsUrl ?? '';
  set airportFlightsUrl(String? val) => _airportFlightsUrl = val;
  bool hasAirportFlightsUrl() => _airportFlightsUrl != null;

  // "alternatives" field.
  List<AirportStruct>? _alternatives;
  List<AirportStruct> get alternatives => _alternatives ?? const [];
  set alternatives(List<AirportStruct>? val) => _alternatives = val;
  void updateAlternatives(Function(List<AirportStruct>) updateFn) =>
      updateFn(_alternatives ??= []);
  bool hasAlternatives() => _alternatives != null;

  static AirportStruct fromMap(Map<String, dynamic> data) => AirportStruct(
        airportCode: data['airport_code'] as String?,
        codeIcao: data['code_icao'] as String?,
        codeIata: data['code_iata'] as String?,
        codeLid: data['code_lid'] as String?,
        name: data['name'] as String?,
        type: data['type'] as String?,
        elevation: castToType<double>(data['elevation']),
        city: data['city'] as String?,
        state: data['state'] as String?,
        longitude: castToType<double>(data['longitude']),
        latitude: castToType<double>(data['latitude']),
        timezone: data['timezone'] as String?,
        countryCode: data['country_code'] as String?,
        wikiUrl: data['wiki_url'] as String?,
        airportFlightsUrl: data['airport_flights_url'] as String?,
        alternatives: getStructList(
          data['alternatives'],
          AirportStruct.fromMap,
        ),
      );

  static AirportStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AirportStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'airport_code': _airportCode,
        'code_icao': _codeIcao,
        'code_iata': _codeIata,
        'code_lid': _codeLid,
        'name': _name,
        'type': _type,
        'elevation': _elevation,
        'city': _city,
        'state': _state,
        'longitude': _longitude,
        'latitude': _latitude,
        'timezone': _timezone,
        'country_code': _countryCode,
        'wiki_url': _wikiUrl,
        'airport_flights_url': _airportFlightsUrl,
        'alternatives': _alternatives?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'airport_code': serializeParam(
          _airportCode,
          ParamType.String,
        ),
        'code_icao': serializeParam(
          _codeIcao,
          ParamType.String,
        ),
        'code_iata': serializeParam(
          _codeIata,
          ParamType.String,
        ),
        'code_lid': serializeParam(
          _codeLid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'elevation': serializeParam(
          _elevation,
          ParamType.double,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'timezone': serializeParam(
          _timezone,
          ParamType.String,
        ),
        'country_code': serializeParam(
          _countryCode,
          ParamType.String,
        ),
        'wiki_url': serializeParam(
          _wikiUrl,
          ParamType.String,
        ),
        'airport_flights_url': serializeParam(
          _airportFlightsUrl,
          ParamType.String,
        ),
        'alternatives': serializeParam(
          _alternatives,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static AirportStruct fromSerializableMap(Map<String, dynamic> data) =>
      AirportStruct(
        airportCode: deserializeParam(
          data['airport_code'],
          ParamType.String,
          false,
        ),
        codeIcao: deserializeParam(
          data['code_icao'],
          ParamType.String,
          false,
        ),
        codeIata: deserializeParam(
          data['code_iata'],
          ParamType.String,
          false,
        ),
        codeLid: deserializeParam(
          data['code_lid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        elevation: deserializeParam(
          data['elevation'],
          ParamType.double,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        timezone: deserializeParam(
          data['timezone'],
          ParamType.String,
          false,
        ),
        countryCode: deserializeParam(
          data['country_code'],
          ParamType.String,
          false,
        ),
        wikiUrl: deserializeParam(
          data['wiki_url'],
          ParamType.String,
          false,
        ),
        airportFlightsUrl: deserializeParam(
          data['airport_flights_url'],
          ParamType.String,
          false,
        ),
        alternatives: deserializeStructParam<AirportStruct>(
          data['alternatives'],
          ParamType.DataStruct,
          true,
          structBuilder: AirportStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AirportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AirportStruct &&
        airportCode == other.airportCode &&
        codeIcao == other.codeIcao &&
        codeIata == other.codeIata &&
        codeLid == other.codeLid &&
        name == other.name &&
        type == other.type &&
        elevation == other.elevation &&
        city == other.city &&
        state == other.state &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        timezone == other.timezone &&
        countryCode == other.countryCode &&
        wikiUrl == other.wikiUrl &&
        airportFlightsUrl == other.airportFlightsUrl &&
        listEquality.equals(alternatives, other.alternatives);
  }

  @override
  int get hashCode => const ListEquality().hash([
        airportCode,
        codeIcao,
        codeIata,
        codeLid,
        name,
        type,
        elevation,
        city,
        state,
        longitude,
        latitude,
        timezone,
        countryCode,
        wikiUrl,
        airportFlightsUrl,
        alternatives
      ]);
}

AirportStruct createAirportStruct({
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
  String? airportFlightsUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AirportStruct(
      airportCode: airportCode,
      codeIcao: codeIcao,
      codeIata: codeIata,
      codeLid: codeLid,
      name: name,
      type: type,
      elevation: elevation,
      city: city,
      state: state,
      longitude: longitude,
      latitude: latitude,
      timezone: timezone,
      countryCode: countryCode,
      wikiUrl: wikiUrl,
      airportFlightsUrl: airportFlightsUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AirportStruct? updateAirportStruct(
  AirportStruct? airport, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    airport
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAirportStructData(
  Map<String, dynamic> firestoreData,
  AirportStruct? airport,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (airport == null) {
    return;
  }
  if (airport.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && airport.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final airportData = getAirportFirestoreData(airport, forFieldValue);
  final nestedData = airportData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = airport.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAirportFirestoreData(
  AirportStruct? airport, [
  bool forFieldValue = false,
]) {
  if (airport == null) {
    return {};
  }
  final firestoreData = mapToFirestore(airport.toMap());

  // Add any Firestore field values
  airport.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAirportListFirestoreData(
  List<AirportStruct>? airports,
) =>
    airports?.map((e) => getAirportFirestoreData(e, true)).toList() ?? [];
