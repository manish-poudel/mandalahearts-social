import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/utils/time_formatter.dart';
import 'package:mandalahearts/core/widgets/custom_network_image.dart';
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

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final isTablet = screenWidth >= 600;

    // Set image height larger on tablet

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ── Header ───────────────────────────────
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
                                  size: 18,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
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

                /// ── Image ───────────────────────────────
                Container(
                  color: Colors.grey.shade300,
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomNetworkImage(
                      imageUrl: imageUrl,

                      fit: BoxFit.contain,
                      borderRadius: 0,
                    ),
                  ),
                ),

                /// ── Caption ─────────────────────────────
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
        ),
      ),
    );
  }
}
