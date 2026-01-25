import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/post_feed/state/post_feed_state.dart';
import 'package:mandalahearts/repository/post_repository.dart';

class PublicPostFeedCubit extends Cubit<PostFeedState> {
  PublicPostFeedCubit(this._repository) : super(const PostFeedState.initial());

  final PostRepository _repository;

  Future<void> loadInitial() async {
    emit(const PostFeedState.loading());

    try {
      await _repository.loadInitialPublicPosts();

      emit(
        PostFeedState.loaded(
          items: _repository.publicFeed,
          hasMore: _repository.hasMore,
        ),
      );
    } catch (e) {
      emit(PostFeedState.initialError(message: e.toString()));
    }
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! PostFeedLoaded) return;
    if (!current.hasMore || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true, loadMoreError: null));

    try {
      await _repository.loadMorePublicPosts();

      final latest = state;
      if (latest is! PostFeedLoaded) return;

      emit(
        latest.copyWith(
          items: _repository.publicFeed,
          hasMore: _repository.hasMore,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      final latest = state;
      if (latest is! PostFeedLoaded) return;

      emit(latest.copyWith(isLoadingMore: false, loadMoreError: e.toString()));
    }
  }

  Future<void> refresh() async {
    final current = state;
    if (current is! PostFeedLoaded || current.isRefreshing) return;

    emit(current.copyWith(isRefreshing: true));

    try {
      await _repository.refreshPublicPosts();

      final latest = state;
      if (latest is! PostFeedLoaded) return;

      emit(latest.copyWith(items: _repository.publicFeed, isRefreshing: false));
    } catch (_) {
      final latest = state;
      if (latest is! PostFeedLoaded) return;

      emit(latest.copyWith(isRefreshing: false));
    }
  }
}
