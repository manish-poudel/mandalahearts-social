import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/view_post/cubit/post_view_state.dart';
import 'package:mandalahearts/models/post_feed_item/post_feed_item.dart';
import 'package:mandalahearts/models/async/async_state.dart';
import 'package:mandalahearts/repository/post_repository.dart';

class PostViewCubit extends Cubit<PostViewState> {
  PostViewCubit({
    required this.post,
    required this.currentUserId,
    required this.repository,
  }) : super(PostViewState.loaded(post, post.creatorId == currentUserId));

  final PostFeedItem post;
  final String currentUserId;
  final PostRepository repository;

  bool get canDelete => post.creatorId == currentUserId;

  Future<void> deletePost() async {
    state.maybeWhen(
      loaded: (postFeedItem, canDelete, deleteState) async {
        if (!canDelete) return;

        // Emit loading state
        emit(
          PostViewState.loaded(
            postFeedItem,
            canDelete,
            deleteState: const AsyncState.loading(),
          ),
        );

        try {
          await repository.deletePost(post);

          emit(const PostViewState.deleted());
        } catch (e) {
          // Keep the loaded state, but set delete error
          emit(
            PostViewState.loaded(
              postFeedItem,
              canDelete,
              deleteState: AsyncState.error('Failed to delete post'),
            ),
          );
        }
      },
      orElse: () {},
    );
  }
}
