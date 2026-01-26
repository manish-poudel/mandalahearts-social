import 'dart:typed_data';

import 'package:mandalahearts/core/services/database/post_db.dart';
import 'package:mandalahearts/core/services/database/user_db.dart';
import 'package:mandalahearts/core/services/storage/file_storage.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
import 'package:mandalahearts/models/post_creator_cache/post_creator_cache.dart';
import 'package:mandalahearts/models/post_feed_item/post_feed_item.dart';
import 'package:mandalahearts/models/user_post/user_post.dart';

class PostRepository {
  PostRepository({
    required FileStorage storage,
    required PostDb postDb,
    required UserDB userService,
  }) : _storage = storage,
       _postDb = postDb,
       _userService = userService;

  final FileStorage _storage;
  final PostDb _postDb;
  final UserDB _userService;

  static const String _postImageBucket = 'post-images';
  static const int _signedUrlExpiry = 157680000 * 20;
  static const int _pageSize = 2;

  /* -------------------------------------------------------------------------- */
  /*                                  PUBLIC FEED                                */
  /* -------------------------------------------------------------------------- */

  final List<PostFeedItem> _cachedPublicFeed = [];
  final Map<String, PostCreatorCache> _creatorCache = {};

  DateTime? _oldestPostTime;
  DateTime? _newestPostTime;
  bool _hasMore = true;

  List<PostFeedItem> get publicFeed => List.unmodifiable(_cachedPublicFeed);
  bool get hasMore => _hasMore;

  /* -------------------------------------------------------------------------- */
  /*                                 PRIVATE FEED                                */
  /* -------------------------------------------------------------------------- */

  final List<PostFeedItem> _cachedPrivateFeed = [];

  DateTime? _oldestPrivatePostTime;
  DateTime? _newestPrivatePostTime;
  bool _hasMorePrivate = true;

  List<PostFeedItem> get privateFeed => List.unmodifiable(_cachedPrivateFeed);

  bool get hasMorePrivate => _hasMorePrivate;

  void clearAllCache() {
    _cachedPublicFeed.clear();
    _cachedPrivateFeed.clear();
    _oldestPostTime = null;
    _newestPostTime = null;
    _hasMore = true;
    _oldestPrivatePostTime = null;
    _newestPrivatePostTime = null;
    _hasMorePrivate = true;
  }
  /* -------------------------------------------------------------------------- */
  /*                                   CRUD POST                               */
  /* -------------------------------------------------------------------------- */

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

  Future<void> deletePost(PostFeedItem item) async {
    final postId = item.post.id;

    try {
      await _postDb.deletePost(postId);
      final filePath = '$postId.png';
      await _storage.deleteFile(bucket: _postImageBucket, filePath: filePath);
      _cachedPublicFeed.removeWhere((e) => e.post.id == postId);
      _cachedPrivateFeed.removeWhere((e) => e.post.id == postId);
    } catch (e) {
      throw Exception('Failed to delete post: $e');
    }
  }

  Future<void> loadInitialPublicPosts() async {
    _cachedPublicFeed.clear();
    _creatorCache.clear();
    _oldestPostTime = null;
    _newestPostTime = null;
    _hasMore = true;

    final posts = await _postDb.fetchPublicPosts(limit: _pageSize);

    if (posts.isEmpty) {
      _hasMore = false;
      return;
    }

    final feedItems = await _buildFeedItems(posts);

    _cachedPublicFeed.addAll(feedItems);
    _newestPostTime = posts.first.createdAt;
    _oldestPostTime = posts.last.createdAt;
  }

  Future<void> loadMorePublicPosts() async {
    if (!_hasMore || _oldestPostTime == null) return;

    final posts = await _postDb.fetchPublicPosts(
      limit: _pageSize,
      olderThan: _oldestPostTime,
    );

    if (posts.isEmpty) {
      _hasMore = false;
      return;
    }

    final feedItems = await _buildFeedItems(posts);
    final uniqueItems = _dedupe(_cachedPublicFeed, feedItems);

    _cachedPublicFeed.addAll(uniqueItems);
    _oldestPostTime = _cachedPublicFeed.last.post.createdAt;
  }

  Future<void> refreshPublicPosts() async {
    if (_newestPostTime == null) {
      await loadInitialPublicPosts();
      return;
    }

    final posts = await _postDb.fetchPublicPosts(
      limit: _pageSize,
      newerThan: _newestPostTime,
    );

    if (posts.isEmpty) return;

    final feedItems = await _buildFeedItems(posts);
    final uniqueItems = _dedupe(_cachedPublicFeed, feedItems);

    _cachedPublicFeed.insertAll(0, uniqueItems);
    _newestPostTime = _cachedPublicFeed.first.post.createdAt;
  }

  /* -------------------------------------------------------------------------- */
  /*                             PRIVATE FEED METHODS (LIMIT PARAM)             */
  /* -------------------------------------------------------------------------- */

  Future<void> loadInitialPrivatePosts(
    String creatorId, {
    int limit = _pageSize,
  }) async {
    // If cache already has posts, just return it without API call
    if (_cachedPrivateFeed.isNotEmpty) {
      _hasMorePrivate = true; // or keep previous value
      _oldestPrivatePostTime = _cachedPrivateFeed.last.post.createdAt;
      _newestPrivatePostTime = _cachedPrivateFeed.first.post.createdAt;

      return; // ✅ return early, no API call
    }

    // Clear cache and reset state if empty
    _cachedPrivateFeed.clear();
    _oldestPrivatePostTime = null;
    _newestPrivatePostTime = null;
    _hasMorePrivate = true;

    // Fetch from API
    final posts = await _postDb.fetchCreatorPosts(
      creatorId: creatorId,
      limit: limit,
    );

    if (posts.isEmpty) {
      _hasMorePrivate = false;
      return;
    }

    final feedItems = await _buildFeedItems(posts);
    _cachedPrivateFeed.addAll(feedItems);

    _newestPrivatePostTime = posts.first.createdAt;
    _oldestPrivatePostTime = posts.last.createdAt;
  }

  Future<void> loadMorePrivatePosts(
    String creatorId, {
    int limit = _pageSize,
  }) async {
    if (!_hasMorePrivate || _oldestPrivatePostTime == null) return;

    final posts = await _postDb.fetchCreatorPosts(
      creatorId: creatorId,
      limit: limit,
      olderThan: _oldestPrivatePostTime,
    );

    if (posts.isEmpty) {
      _hasMorePrivate = false;
      return;
    }

    final feedItems = await _buildFeedItems(posts);
    final uniqueItems = _dedupe(_cachedPrivateFeed, feedItems);

    _cachedPrivateFeed.addAll(uniqueItems);
    _oldestPrivatePostTime = _cachedPrivateFeed.last.post.createdAt;
  }

  Future<void> refreshPrivatePosts(
    String creatorId, {
    int limit = _pageSize,
  }) async {
    if (_newestPrivatePostTime == null) {
      await loadInitialPrivatePosts(creatorId, limit: limit);
      return;
    }

    final posts = await _postDb.fetchCreatorPosts(
      creatorId: creatorId,
      limit: limit,
      newerThan: _newestPrivatePostTime,
    );

    if (posts.isEmpty) return;

    final feedItems = await _buildFeedItems(posts);
    final uniqueItems = _dedupe(_cachedPrivateFeed, feedItems);

    _cachedPrivateFeed.insertAll(0, uniqueItems);
    _newestPrivatePostTime = _cachedPrivateFeed.first.post.createdAt;
  }

  /* -------------------------------------------------------------------------- */
  /*                        PUBLIC CREATOR FEED (NO CACHE)                       */
  /* -------------------------------------------------------------------------- */

  Future<List<PostFeedItem>> fetchInitialCreatorPosts({
    required String creatorId,
    int limit = _pageSize,
  }) async {
    final posts = await _postDb.fetchCreatorPosts(
      creatorId: creatorId,
      limit: limit,
    );

    return _buildFeedItems(posts);
  }

  Future<List<PostFeedItem>> fetchMoreCreatorPosts({
    required String creatorId,
    required DateTime olderThan,
    int limit = _pageSize,
  }) async {
    final posts = await _postDb.fetchCreatorPosts(
      creatorId: creatorId,
      limit: limit,
      olderThan: olderThan,
    );

    return _buildFeedItems(posts);
  }

  /* -------------------------------------------------------------------------- */
  /*                                HELPERS (EXISTING STYLE)                     */
  /* -------------------------------------------------------------------------- */

  Future<List<PostFeedItem>> _buildFeedItems(List<UserPost> posts) async {
    final creatorIds = posts.map((p) => p.creatorId).toSet();

    final missingCreatorIds = creatorIds
        .where((id) => !_creatorCache.containsKey(id))
        .toList();

    for (final creatorId in missingCreatorIds) {
      final data = await _userService.getUser(creatorId);
      if (data == null) continue;

      final user = AppUser.fromJson(data);

      _creatorCache[creatorId] = PostCreatorCache(
        id: user.uid,
        name:
            ('${user.basicDetails?.firstName ?? ''} ${user.basicDetails?.secondName ?? ''}')
                .trim()
                .isEmpty
            ? 'Unknown'
            : ('${user.basicDetails?.firstName ?? ''} ${user.basicDetails?.secondName ?? ''}')
                  .trim(),
        profileImageUrl: user.basicDetails?.profilePictureUrl,
      );
    }

    return posts.map((post) {
      final creator = _creatorCache[post.creatorId]!;

      return PostFeedItem(
        post: post,
        creatorId: creator.id,
        creatorName: creator.name,
        creatorProfileImageUrl: creator.profileImageUrl,
      );
    }).toList();
  }

  List<PostFeedItem> _dedupe(
    List<PostFeedItem> existing,
    List<PostFeedItem> incoming,
  ) {
    final existingIds = existing.map((e) => e.post.id).toSet();

    return incoming
        .where((item) => !existingIds.contains(item.post.id))
        .toList();
  }
}
