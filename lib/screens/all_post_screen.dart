import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
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

    _scrollController.addListener(() {
      // Auto-load more when near the bottom
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

  void refresh() {
    context.read<PublicPostFeedCubit>().emitLatest();
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

            loaded: (items, hasMore, isLoadingMore, isRefreshing, loadMoreError) {
              // Show "Load More" button if items < 2 or there are more posts
              final showLoadMoreButton = items.length < 2 || hasMore;

              return RefreshIndicator(
                onRefresh: () => context.read<PublicPostFeedCubit>().refresh(),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),

                      child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: items.length + (showLoadMoreButton ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < items.length) {
                            final item = items[index];
                            final post = item.post;

                            return GestureDetector(
                              onTap: () async {
                                final deleted = await context.push(
                                  AppRoute.postViewScreen.path,
                                  extra: item,
                                );
                                if (deleted == true) refresh();
                              },
                              child: PostCard(
                                userId: item.creatorId,
                                username: item.creatorName,
                                profileImageUrl: item.creatorProfileImageUrl,
                                imageUrl: post.imageUrl,
                                caption: post.caption,
                                createdAt: post.createdAt,
                              ),
                            );
                          } else {
                            // Always show "Load More" button at the bottom if needed
                            return isLoadingMore
                                ? Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      context
                                          .read<PublicPostFeedCubit>()
                                          .loadMore();
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsGeometry.all(16),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  );
                          }
                        },
                      ),
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
