import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/utils/time_formatter.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';

class PostCard extends StatelessWidget {
  final String userId;
  final String username;
  final String imageUrl;
  final String caption;
  final DateTime createdAt;
  final String? profileImageUrl;

  const PostCard({
    super.key,
    required this.userId,
    required this.username,
    required this.imageUrl,
    required this.caption,
    required this.createdAt,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (context.read<AppUserRepository>().currentUser?.uid ==
                    userId) {
                  context.push(AppRoute.profileViewScreen.path);
                } else {
                  context.push('/public_profile/$userId');
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: profileImageUrl != null
                          ? NetworkImage(profileImageUrl!)
                          : null,
                      child: profileImageUrl == null
                          ? const Icon(
                              Icons.person,
                              size: 16,
                              color: Colors.grey,
                            )
                          : null,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          TimeFormatter.timeAgo(createdAt) ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onSurface.withAlpha(120),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// ── Image ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: const CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            /// ── Caption ────────────────────────────────────
            if (caption.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
                child: Text(
                  caption,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
