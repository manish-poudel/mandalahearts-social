import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/profile_avatar.dart';

class ProfileHeaderView extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String username;
  final String country;
  final String bio;
  final String profileImage;

  const ProfileHeaderView({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.country,
    required this.bio,
    required this.profileImage,
  });

  String get _fullName =>
      [firstName, lastName].where((e) => e.trim().isNotEmpty).join(' ');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Avatar
            ProfileAvatar(imageUrl: profileImage, radius: 46),

            const SizedBox(height: 12),

            if (_fullName.isNotEmpty)
              Text(
                _fullName,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

            const SizedBox(height: 6),

            // Country
            if (country.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on_outlined, size: 16),
                  const SizedBox(width: 4),
                  Text(country, style: theme.textTheme.bodyMedium),
                ],
              ),

            // Bio
            if (bio.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                bio,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
