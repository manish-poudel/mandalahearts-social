import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/basic_profile_view.dart';
import 'package:mandalahearts/core/widgets/post_grid_view.dart';
import 'package:mandalahearts/core/widgets/spiritual_master_view.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// ===== DUMMY DATA =====
    final profileName = 'Manish Sharma';
    final country = 'Nepal';
    final bio = 'Walking the path of mindfulness and self-discovery.';
    final profileImage = 'https://i.pravatar.cc/300';

    final spiritualMasters = [
      {
        'master': 'Sadhguru',
        'affiliation': 'Isha Foundation',
        'description':
            'Learning inner balance, awareness, and conscious living.',
      },
      {
        'master': 'Thich Nhat Hanh',
        'affiliation': 'Plum Village',
        'description':
            'Inspired by mindfulness, compassion, and present-moment awareness.',
      },
    ];

    final posts = List.generate(
      9,
      (index) => 'https://picsum.photos/300?random=$index',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            ProfileHeaderView(
              name: profileName,
              country: country,
              bio: bio,
              profileImage: profileImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
                child: const Text('Edit profile'),
              ),
            ),
            const SizedBox(height: 24),
            SpiritualMastersView(items: spiritualMasters),
            const SizedBox(height: 32),
            PostGridView(posts: posts),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
