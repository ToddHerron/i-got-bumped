import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AirlinesRecord extends FirestoreRecord {
  AirlinesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "disruptionServices" field.
  List<DisruptionServiceStruct>? _disruptionServices;
  List<DisruptionServiceStruct> get disruptionServices =>
      _disruptionServices ?? const [];
  bool hasDisruptionServices() => _disruptionServices != null;

  // "CarrierName" field.
  String? _carrierName;
  String get carrierName => _carrierName ?? '';
  bool hasCarrierName() => _carrierName != null;

  // "IATA2LetterCode" field.
  String? _iATA2LetterCode;
  String get iATA2LetterCode => _iATA2LetterCode ?? '';
  bool hasIATA2LetterCode() => _iATA2LetterCode != null;

  // "IATA3LetterCode" field.
  String? _iATA3LetterCode;
  String get iATA3LetterCode => _iATA3LetterCode ?? '';
  bool hasIATA3LetterCode() => _iATA3LetterCode != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _disruptionServices = getStructList(
      snapshotData['disruptionServices'],
      DisruptionServiceStruct.fromMap,
    );
    _carrierName = snapshotData['CarrierName'] as String?;
    _iATA2LetterCode = snapshotData['IATA2LetterCode'] as String?;
    _iATA3LetterCode = snapshotData['IATA3LetterCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('airlines');

  static Stream<AirlinesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AirlinesRecord.fromSnapshot(s));

  static Future<AirlinesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AirlinesRecord.fromSnapshot(s));

  static AirlinesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AirlinesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AirlinesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AirlinesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AirlinesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AirlinesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAirlinesRecordData({
  DocumentReference? uid,
  String? carrierName,
  String? iATA2LetterCode,
  String? iATA3LetterCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'CarrierName': carrierName,
      'IATA2LetterCode': iATA2LetterCode,
      'IATA3LetterCode': iATA3LetterCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class AirlinesRecordDocumentEquality implements Equality<AirlinesRecord> {
  const AirlinesRecordDocumentEquality();

  @override
  bool equals(AirlinesRecord? e1, AirlinesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        listEquality.equals(e1?.disruptionServices, e2?.disruptionServices) &&
        e1?.carrierName == e2?.carrierName &&
        e1?.iATA2LetterCode == e2?.iATA2LetterCode &&
        e1?.iATA3LetterCode == e2?.iATA3LetterCode;
  }

  @override
  int hash(AirlinesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.disruptionServices,
        e?.carrierName,
        e?.iATA2LetterCode,
        e?.iATA3LetterCode
      ]);

  @override
  bool isValidKey(Object? o) => o is AirlinesRecord;
}
