import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/post_feed/post_feed_cubit.dart';
import 'package:mandalahearts/features/post_feed/post_feed_state.dart';

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

    context.read<PostFeedCubit>().loadInitial();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        context.read<PostFeedCubit>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostFeedCubit, PostFeedState>(
      listenWhen: (prev, curr) =>
          curr is PostFeedLoaded && curr.loadMoreError != null,
      listener: (context, state) {
        final loaded = state as PostFeedLoaded;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(loaded.loadMoreError!)));
      },
      child: BlocBuilder<PostFeedCubit, PostFeedState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),

            loading: () => const Center(child: CircularProgressIndicator()),

            initialError: (msg) =>
                Center(child: Text(msg, textAlign: TextAlign.center)),

            loaded:
                (items, hasMore, isLoadingMore, isRefreshing, loadMoreError) {
                  return RefreshIndicator(
                    onRefresh: () => context.read<PostFeedCubit>().refresh(),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: items.length + (isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= items.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final item = items[index];
                        final post = item.post;

                        return ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: CircleAvatar(
                            backgroundImage: item.creatorProfileImageUrl != null
                                ? NetworkImage(item.creatorProfileImageUrl!)
                                : null,
                            child: item.creatorProfileImageUrl == null
                                ? const Icon(Icons.person)
                                : null,
                          ),
                          title: Text(item.creatorName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Image.network(post.imageUrl),
                              const SizedBox(height: 8),
                              Text(post.caption),
                            ],
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
