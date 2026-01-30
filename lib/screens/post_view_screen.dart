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
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Post'),
            actions: [
              state.maybeWhen(
                loaded: (_, canDelete, deleteState) {
                  if (!canDelete) return const SizedBox.shrink();

                  return deleteState.maybeWhen(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    orElse: () => PopupMenuButton<_PostMenuAction>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (action) {
                        if (action == _PostMenuAction.delete) {
                          _confirmDelete(context);
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: _PostMenuAction.delete,
                          child: Row(
                            children: [
                              Icon(Icons.delete_outline, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
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
            loaded: (postFeedItem, _, __) {
              return SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// ── IMAGE (FULLY VISIBLE, NO CROP) ──
                        Image.network(
                          postFeedItem.post.imageUrl,
                          fit: BoxFit.contain, // 👈 IMPORTANT
                          width: double.infinity,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              height: 300,
                              color: Colors.grey.shade300,
                            );
                          },
                          errorBuilder: (_, __, ___) => Container(
                            height: 300,
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const Icon(Icons.broken_image),
                          ),
                        ),

                        /// ── CAPTION ───────────────────────
                        if (postFeedItem.post.caption.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              postFeedItem.post.caption,
                              style: const TextStyle(fontSize: 15, height: 1.5),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
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

enum _PostMenuAction { delete }
