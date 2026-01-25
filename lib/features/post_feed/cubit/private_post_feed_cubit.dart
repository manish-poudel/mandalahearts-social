import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/post_feed/state/post_feed_state.dart';
import 'package:mandalahearts/repository/post_repository.dart';

class CreatorPostFeedCubit extends Cubit<PostFeedState> {
  CreatorPostFeedCubit({
    required this.creatorId,
    required this.repository,
    required this.profileMode,
    this.pageSize = 9,
  }) : super(const PostFeedState.initial());

  final String creatorId;
  final PostRepository repository;
  final ProfileMode profileMode;
  final int pageSize;

  bool _isLoadingMore = false;

  /// Load initial posts
  Future<void> loadInitial() async {
    emit(const PostFeedState.loading());

    try {
      // Always fetch from repository, no caching
      final posts = await repository.fetchInitialCreatorPosts(
        creatorId: creatorId,
        limit: pageSize,
      );

      emit(
        PostFeedState.loaded(
          items: posts,
          hasMore: posts.length == pageSize, // assume more if pageSize reached
        ),
      );
    } catch (e) {
      emit(PostFeedState.initialError(message: e.toString()));
    }
  }

  /// Remove a post from the feed by postId and emit updated state
  void removePost(String postId) {
    final current = state;
    if (current is! PostFeedLoaded) return;

    final updatedItems = current.items
        .where((p) => p.post.id != postId)
        .toList();

    emit(
      current.copyWith(
        items: updatedItems,
        hasMore: current.hasMore,
        isLoadingMore: current.isLoadingMore,
        loadMoreError: current.loadMoreError,
        isRefreshing: current.isRefreshing,
      ),
    );
  }

  /// Load next page
  Future<void> loadMore() async {
    final current = state;
    if (current is! PostFeedLoaded || !current.hasMore || _isLoadingMore) {
      return;
    }

    _isLoadingMore = true;
    emit(current.copyWith(isLoadingMore: true, loadMoreError: null));

    try {
      if (current.items.isEmpty) {
        loadInitial();
        return;
      }
      final olderThan = current.items.last.post.createdAt;
      final posts = await repository.fetchMoreCreatorPosts(
        creatorId: creatorId,
        limit: pageSize,
        olderThan: olderThan,
      );

      emit(
        current.copyWith(
          items: [...current.items, ...posts],
          hasMore: posts.length == pageSize,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(current.copyWith(isLoadingMore: false, loadMoreError: e.toString()));
    } finally {
      _isLoadingMore = false;
    }
  }
}
