import 'package:mandalahearts/models/post/user_post.dart';

abstract class PostDb {
  String generateId();
  Future<void> savePost({required UserPost post});
  Future<List<UserPost>> fetchPosts({required int limit, DateTime? olderThan});
}
