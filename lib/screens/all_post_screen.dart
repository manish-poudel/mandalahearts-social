import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/post_card.dart';
import 'package:mandalahearts/core/widgets/post_card_shimmer.dart';
import 'package:mandalahearts/features/post_feed/cubit/public_post_feed_cubit.dart';
import 'package:mandalahearts/features/post_feed/state/post_feed_state.dart';

class AllPostScreen extends StatefulWidget {
  const AllPostScreen({super.key});

  @override
  State<AllPostScreen> createState() => _AllPostScreenState();
}

class _AllPostScreenState extends State<AllPostScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<PublicPostFeedCubit>().loadInitial();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        context.read<PublicPostFeedCubit>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int _skeletonCount(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    const approxPostCardHeight = 420.0;
    return (height / approxPostCardHeight).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PublicPostFeedCubit, PostFeedState>(
      listenWhen: (prev, curr) =>
          curr is PostFeedLoaded && curr.loadMoreError != null,
      listener: (context, state) {
        final loaded = state as PostFeedLoaded;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(loaded.loadMoreError!)));
      },
      child: BlocBuilder<PublicPostFeedCubit, PostFeedState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),

            loading: () {
              final count = _skeletonCount(context);

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: count,
                itemBuilder: (_, _) => const PostCardShimmer(),
              );
            },

            initialError: (msg) =>
                Center(child: Text(msg, textAlign: TextAlign.center)),

            loaded:
                (items, hasMore, isLoadingMore, isRefreshing, loadMoreError) {
                  return RefreshIndicator(
                    onRefresh: () =>
                        context.read<PublicPostFeedCubit>().refresh(),
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: items.length + (isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        /// Pagination loader
                        // todo: circular progress theme
                        if (index >= items.length) {
                          return Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }

                        final item = items[index];
                        final post = item.post;

                        return PostCard(
                          userId: item.creatorId,
                          username: item.creatorName,
                          profileImageUrl: item.creatorProfileImageUrl,
                          imageUrl: post.imageUrl,
                          caption: post.caption,
                          createdAt: post.createdAt,
                        );
                      },
                    ),
                  );
                },
          );
        },
      ),
    );
  }
}
