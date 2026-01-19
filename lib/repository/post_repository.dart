import 'dart:typed_data';
import 'package:mandalahearts/core/services/database/post_db.dart';
import 'package:mandalahearts/core/services/storage/file_storage.dart';
import 'package:mandalahearts/models/post/user_post.dart';

class PostRepository {
  PostRepository({required FileStorage storage, required PostDb postDb})
    : _storage = storage,
      _postDb = postDb;

  final FileStorage _storage;
  final PostDb _postDb;

  static const String _postImageBucket = 'post-images';
  static const int _signedUrlExpiry = 157680000;

  static const int _pageSize = 20;
  final List<UserPost> _cachedPosts = [];
  DateTime? _oldestPostTime;
  bool _hasMore = true;

  List<UserPost> get posts => List.unmodifiable(_cachedPosts);
  bool get hasMore => _hasMore;

  Future<void> createPost({
    required String creatorId,
    required Uint8List imageBytes,
    required String caption,
  }) async {
    final postId = _postDb.generateId();
    final imageUrl = await _savePostImage(
      postId: postId,
      imageBytes: imageBytes,
    );

    if (imageUrl == null) {
      throw Exception('Failed to upload post image');
    }
    final post = UserPost(
      id: postId,
      caption: caption,
      imageUrl: imageUrl,
      createdAt: DateTime.now(),
      creatorId: creatorId,
    );
    await _postDb.savePost(post: post);
  }

  Future<String?> _savePostImage({
    required String postId,
    required Uint8List imageBytes,
    String extension = 'png',
    String contentType = 'image/png',
  }) async {
    final filePath = '$postId.$extension';

    await _storage.uploadImage(
      bucket: _postImageBucket,
      filePath: filePath,
      bytes: imageBytes,
      contentType: contentType,
    );

    return _storage.createSignedUrl(
      bucket: _postImageBucket,
      filePath: filePath,
      expiresInSeconds: _signedUrlExpiry,
    );
  }

  Future<void> loadInitial() async {
    _cachedPosts.clear();
    _oldestPostTime = null;
    _hasMore = true;

    final posts = await _postDb.fetchPosts(limit: _pageSize);

    if (posts.isEmpty) {
      _hasMore = false;
      return;
    }

    _cachedPosts.addAll(posts);
    _oldestPostTime = posts.last.createdAt;
  }

  Future<void> loadMore() async {
    if (!_hasMore || _oldestPostTime == null) return;

    final posts = await _postDb.fetchPosts(
      limit: _pageSize,
      olderThan: _oldestPostTime,
    );

    if (posts.isEmpty) {
      _hasMore = false;
      return;
    }

    final uniquePosts = _dedupe(posts);

    _cachedPosts.addAll(uniquePosts);
    _oldestPostTime = _cachedPosts.last.createdAt;
  }

  List<UserPost> _dedupe(List<UserPost> incoming) {
    final existingIds = _cachedPosts.map((e) => e.id).toSet();
    return incoming.where((p) => !existingIds.contains(p.id)).toList();
  }
}
