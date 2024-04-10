import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "userTitle" field.
  String? _userTitle;
  String get userTitle => _userTitle ?? '';
  bool hasUserTitle() => _userTitle != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "offensiveDays" field.
  int? _offensiveDays;
  int get offensiveDays => _offensiveDays ?? 0;
  bool hasOffensiveDays() => _offensiveDays != null;

  // "updateOffensiveDays" field.
  DateTime? _updateOffensiveDays;
  DateTime? get updateOffensiveDays => _updateOffensiveDays;
  bool hasUpdateOffensiveDays() => _updateOffensiveDays != null;

  // "lastLogin" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "averageScore" field.
  List<int>? _averageScore;
  List<int> get averageScore => _averageScore ?? const [];
  bool hasAverageScore() => _averageScore != null;

  // "lastLessonCompletedAt" field.
  DateTime? _lastLessonCompletedAt;
  DateTime? get lastLessonCompletedAt => _lastLessonCompletedAt;
  bool hasLastLessonCompletedAt() => _lastLessonCompletedAt != null;

  // "optInPushNotifications" field.
  bool? _optInPushNotifications;
  bool get optInPushNotifications => _optInPushNotifications ?? false;
  bool hasOptInPushNotifications() => _optInPushNotifications != null;

  // "optInEmail" field.
  bool? _optInEmail;
  bool get optInEmail => _optInEmail ?? false;
  bool hasOptInEmail() => _optInEmail != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
    _uid = snapshotData['uid'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _location = snapshotData['location'] as LatLng?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userTitle = snapshotData['userTitle'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _offensiveDays = castToType<int>(snapshotData['offensiveDays']);
    _updateOffensiveDays = snapshotData['updateOffensiveDays'] as DateTime?;
    _lastLogin = snapshotData['lastLogin'] as DateTime?;
    _averageScore = getDataList(snapshotData['averageScore']);
    _lastLessonCompletedAt = snapshotData['lastLessonCompletedAt'] as DateTime?;
    _optInPushNotifications = snapshotData['optInPushNotifications'] as bool?;
    _optInEmail = snapshotData['optInEmail'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? email,
  String? password,
  String? uid,
  int? age,
  LatLng? location,
  String? phoneNumber,
  DateTime? createdTime,
  String? userTitle,
  String? photoUrl,
  int? offensiveDays,
  DateTime? updateOffensiveDays,
  DateTime? lastLogin,
  DateTime? lastLessonCompletedAt,
  bool? optInPushNotifications,
  bool? optInEmail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'email': email,
      'password': password,
      'uid': uid,
      'age': age,
      'location': location,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'userTitle': userTitle,
      'photo_url': photoUrl,
      'offensiveDays': offensiveDays,
      'updateOffensiveDays': updateOffensiveDays,
      'lastLogin': lastLogin,
      'lastLessonCompletedAt': lastLessonCompletedAt,
      'optInPushNotifications': optInPushNotifications,
      'optInEmail': optInEmail,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.password == e2?.password &&
        e1?.uid == e2?.uid &&
        e1?.age == e2?.age &&
        e1?.location == e2?.location &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userTitle == e2?.userTitle &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.offensiveDays == e2?.offensiveDays &&
        e1?.updateOffensiveDays == e2?.updateOffensiveDays &&
        e1?.lastLogin == e2?.lastLogin &&
        listEquality.equals(e1?.averageScore, e2?.averageScore) &&
        e1?.lastLessonCompletedAt == e2?.lastLessonCompletedAt &&
        e1?.optInPushNotifications == e2?.optInPushNotifications &&
        e1?.optInEmail == e2?.optInEmail;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.email,
        e?.password,
        e?.uid,
        e?.age,
        e?.location,
        e?.phoneNumber,
        e?.createdTime,
        e?.userTitle,
        e?.photoUrl,
        e?.offensiveDays,
        e?.updateOffensiveDays,
        e?.lastLogin,
        e?.averageScore,
        e?.lastLessonCompletedAt,
        e?.optInPushNotifications,
        e?.optInEmail
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
