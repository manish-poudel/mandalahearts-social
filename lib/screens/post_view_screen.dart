import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/view_post/cubit/post_view_cubit.dart';
import 'package:mandalahearts/features/view_post/cubit/post_view_state.dart';
import 'package:mandalahearts/models/async/async_state.dart';

class PostViewScreen extends StatelessWidget {
  const PostViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostViewCubit, PostViewState>(
      listener: (context, state) {
        state.maybeWhen(
          deleted: () => Navigator.of(context).pop(true),
          loaded: (_, _, deleteState) {
            deleteState.maybeWhen(
              error: (msg) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(msg), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Post'),
            actions: [
              state.maybeWhen(
                loaded: (postFeedItem, canDelete, deleteState) {
                  if (!canDelete) return const SizedBox.shrink();

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: deleteState.maybeWhen(
                      loading: () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      orElse: () => IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () => _confirmDelete(context),
                      ),
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          ),
          body: state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            deleted: () => const SizedBox.shrink(),
            loaded: (postFeedItem, _, __) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    postFeedItem.post.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (c, child, progress) {
                      if (progress == null) return child;
                      return Container(color: Colors.grey.shade300);
                    },
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                ),
                // Caption
                if (postFeedItem.post.caption.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      postFeedItem.post.caption,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete post?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<PostViewCubit>().deletePost();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
