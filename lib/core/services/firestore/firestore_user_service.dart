import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandalahearts/core/services/database/user_db.dart';

class FirestoreUserService implements UserDB {
  FirestoreUserService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _usersRef =>
      _firestore.collection('users');

  @override
  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> json,
  }) {
    return _usersRef.doc(userId).set(json);
  }

  @override
  Future<void> updateUser({
    required String userId,
    required Map<String, dynamic> json,
  }) {
    return _usersRef.doc(userId).update(json);
  }

  @override
  Future<Map<String, dynamic>?> getUser(String userId) async {
    final snapshot = await _usersRef.doc(userId).get();

    if (!snapshot.exists) return null;
    return snapshot.data();
  }

  @override
  Stream<Map<String, dynamic>?> streamUser(String userId) {
    return _usersRef.doc(userId).snapshots().map((snapshot) {
      if (!snapshot.exists) return null;
      return snapshot.data();
    });
  }
}
