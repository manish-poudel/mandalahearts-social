import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandalahearts/core/services/database/post_db.dart';
import 'package:mandalahearts/models/post/user_post.dart';

class FirestoreUserPostService implements PostDb {
  FirestoreUserPostService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  static const String _collection = 'user_posts';

  @override
  String generateId() {
    return _firestore.collection(_collection).doc().id;
  }

  @override
  Future<void> savePost({required UserPost post}) async {
    await _firestore.collection(_collection).doc(post.id).set(post.toJson());
  }

  @override
  Future<List<UserPost>> fetchPosts({
    required int limit,
    DateTime? olderThan,
  }) async {
    Query query = _firestore
        .collection(_collection)
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (olderThan != null) {
      query = query.where(
        'createdAt',
        isLessThan: Timestamp.fromDate(olderThan),
      );
    }

    final snapshot = await query.get();

    return snapshot.docs
        .map((doc) => UserPost.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
