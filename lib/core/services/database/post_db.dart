import 'package:mandalahearts/models/user_post/user_post.dart';

abstract class PostDb {
  String generateId();
  Future<void> savePost({required UserPost post});
  Future<List<UserPost>> fetchPublicPosts({
    required int limit,
    DateTime? olderThan,
    DateTime? newerThan,
  });
  Future<List<UserPost>> fetchCreatorPosts({
    required String creatorId,
    required int limit,
    DateTime? olderThan,
    DateTime? newerThan,
  });

  Future<List<UserPost>> fetchAllPostsByCreator(
    String creatorId, {
    int limit = 100,
  });

  Future<void> deletePost(String postId);
}
