import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/models/user_post/user_post.dart';

part 'post_feed_item.freezed.dart';

@freezed
abstract class PostFeedItem with _$PostFeedItem {
  const factory PostFeedItem({
    required UserPost post,
    required String creatorId,
    required String creatorName,
    String? creatorProfileImageUrl,
  }) = _PostFeedItem;
}
