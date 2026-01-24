import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandalahearts/core/services/database/spiritual_masters_db.dart';

class FirestoreSpiritualMasterService implements SpiritualMastersDb {
  FirestoreSpiritualMasterService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _mastersRef =>
      _firestore.collection('spiritual_masters');

  @override
  Future<List<Map<String, dynamic>>> getSpiritualMasters() async {
    final snapshot = await _mastersRef.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
