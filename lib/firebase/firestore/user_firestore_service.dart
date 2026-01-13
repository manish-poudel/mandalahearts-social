import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreService {
  UserFirestoreService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _usersRef =>
      _firestore.collection('users');

  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> json,
  }) {
    return _usersRef.doc(userId).set(json);
  }

  Future<void> updateUser({
    required String userId,
    required Map<String, dynamic> json,
  }) {
    return _usersRef.doc(userId).update(json);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser(String userId) {
    return _usersRef.doc(userId).snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String userId) {
    return _usersRef.doc(userId).get();
  }
}
