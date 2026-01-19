import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/models/post_feed_item/post_feed_item.dart';

part 'post_feed_state.freezed.dart';

@freezed
class PostFeedState with _$PostFeedState {
  const factory PostFeedState.initial() = PostFeedInitial;

  const factory PostFeedState.loading() = PostFeedLoading;

  /// Initial load failed (full screen error)
  const factory PostFeedState.initialError({required String message}) =
      PostFeedInitialError;

  const factory PostFeedState.loaded({
    required List<PostFeedItem> items,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    String? loadMoreError,
  }) = PostFeedLoaded;
}
