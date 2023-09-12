// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisruptionServiceStruct extends FFFirebaseStruct {
  DisruptionServiceStruct({
    String? serviceName,
    String? serviceURL,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _serviceName = serviceName,
        _serviceURL = serviceURL,
        _language = language,
        super(firestoreUtilData);

  // "ServiceName" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  set serviceName(String? val) => _serviceName = val;
  bool hasServiceName() => _serviceName != null;

  // "ServiceURL" field.
  String? _serviceURL;
  String get serviceURL => _serviceURL ?? '';
  set serviceURL(String? val) => _serviceURL = val;
  bool hasServiceURL() => _serviceURL != null;

  // "Language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;
  bool hasLanguage() => _language != null;

  static DisruptionServiceStruct fromMap(Map<String, dynamic> data) =>
      DisruptionServiceStruct(
        serviceName: data['ServiceName'] as String?,
        serviceURL: data['ServiceURL'] as String?,
        language: data['Language'] as String?,
      );

  static DisruptionServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? DisruptionServiceStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'ServiceName': _serviceName,
        'ServiceURL': _serviceURL,
        'Language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ServiceName': serializeParam(
          _serviceName,
          ParamType.String,
        ),
        'ServiceURL': serializeParam(
          _serviceURL,
          ParamType.String,
        ),
        'Language': serializeParam(
          _language,
          ParamType.String,
        ),
      }.withoutNulls;

  static DisruptionServiceStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DisruptionServiceStruct(
        serviceName: deserializeParam(
          data['ServiceName'],
          ParamType.String,
          false,
        ),
        serviceURL: deserializeParam(
          data['ServiceURL'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['Language'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DisruptionServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DisruptionServiceStruct &&
        serviceName == other.serviceName &&
        serviceURL == other.serviceURL &&
        language == other.language;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([serviceName, serviceURL, language]);
}

DisruptionServiceStruct createDisruptionServiceStruct({
  String? serviceName,
  String? serviceURL,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DisruptionServiceStruct(
      serviceName: serviceName,
      serviceURL: serviceURL,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DisruptionServiceStruct? updateDisruptionServiceStruct(
  DisruptionServiceStruct? disruptionService, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    disruptionService
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDisruptionServiceStructData(
  Map<String, dynamic> firestoreData,
  DisruptionServiceStruct? disruptionService,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (disruptionService == null) {
    return;
  }
  if (disruptionService.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && disruptionService.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final disruptionServiceData =
      getDisruptionServiceFirestoreData(disruptionService, forFieldValue);
  final nestedData =
      disruptionServiceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = disruptionService.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDisruptionServiceFirestoreData(
  DisruptionServiceStruct? disruptionService, [
  bool forFieldValue = false,
]) {
  if (disruptionService == null) {
    return {};
  }
  final firestoreData = mapToFirestore(disruptionService.toMap());

  // Add any Firestore field values
  disruptionService.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDisruptionServiceListFirestoreData(
  List<DisruptionServiceStruct>? disruptionServices,
) =>
    disruptionServices
        ?.map((e) => getDisruptionServiceFirestoreData(e, true))
        .toList() ??
    [];
