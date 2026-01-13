import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandalahearts/core/exceptions/firestore_exceptions.dart';
import 'package:mandalahearts/core/services/database/username_db.dart';

class FirestoreUsernameService extends UsernameDB {
  final FirebaseFirestore _firestore;

  FirestoreUsernameService(this._firestore);

  @override
  Future<void> createUsername({
    required String username,
    required String userId,
  }) async {
    final usernameDocRef = _firestore.collection('username').doc(username);
    final userDocRef = _firestore.collection('users').doc(userId);

    await _firestore.runTransaction((transaction) async {
      final usernameSnap = await transaction.get(usernameDocRef);

      if (usernameSnap.exists) {
        throw UsernameAlreadyExistsException('Username already exists');
      }

      transaction.set(usernameDocRef, {'uid': userId});
      transaction.set(userDocRef, {
        'uid': userId,
        'username': username,
      }, SetOptions(merge: true));
    });
  }

  @override
  Future<bool> usernameExists(String username) async {
    final doc = await _firestore.collection('username').doc(username).get();
    return doc.exists;
  }
}
