import 'package:flutter/material.dart';

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

  bool get _hasProfileImage => profileImage.trim().isNotEmpty;

  String get _fullName =>
      [firstName, lastName].where((e) => e.trim().isNotEmpty).join(' ');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary.withAlpha(120),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 46,
                backgroundColor: _hasProfileImage
                    ? theme.colorScheme.surface
                    : Colors.grey.shade300,
                backgroundImage: _hasProfileImage
                    ? NetworkImage(profileImage)
                    : null,
                child: !_hasProfileImage
                    ? Icon(Icons.person, size: 40, color: Colors.grey.shade600)
                    : null,
              ),
            ),

            const SizedBox(height: 12),

            // Full Name
            if (_fullName.isNotEmpty)
              Text(
                _fullName,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

            // Username
            // if (username.isNotEmpty) ...[
            //   const SizedBox(height: 4),
            //   Text(
            //     '@$username',
            //     style: theme.textTheme.bodyMedium?.copyWith(
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ],
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
