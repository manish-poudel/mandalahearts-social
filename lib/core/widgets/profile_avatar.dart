import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 48,
    this.onTap,
  });

  bool get _hasImage => imageUrl.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar = Container(
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
        backgroundColor: _hasImage
            ? theme.colorScheme.surface
            : Colors.grey.shade300,
        backgroundImage: _hasImage ? NetworkImage(imageUrl) : null,
        child: !_hasImage
            ? Icon(Icons.person, size: 40, color: Colors.white)
            : null,
      ),
    );

    if (onTap == null) return avatar;

    return GestureDetector(onTap: onTap, child: avatar);
  }
}
