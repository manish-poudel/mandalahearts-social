import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/models/post_feed_item/post_feed_item.dart';
import 'package:mandalahearts/models/async/async_state.dart';

part 'post_view_state.freezed.dart';

@freezed
class PostViewState with _$PostViewState {
  const factory PostViewState.loading() = _Loading;

  const factory PostViewState.loaded(
    PostFeedItem postFeedItem,
    bool canDelete, {
    @Default(AsyncState.initial()) AsyncState deleteState,
  }) = _Loaded;

  const factory PostViewState.deleted() = _Deleted;
}
