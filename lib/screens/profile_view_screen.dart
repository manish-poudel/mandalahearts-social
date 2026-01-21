import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/basic_profile_view.dart';
import 'package:mandalahearts/core/widgets/post_grid_view.dart';
import 'package:mandalahearts/core/widgets/spiritual_master_view.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/profile_view/cubits/profile_view_cubit.dart';
import 'package:mandalahearts/features/profile_view/cubits/profile_view_state.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// TEMP: dummy spiritual data (until backend ready)
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

    /// TEMP: static posts
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
            BlocBuilder<ProfileCubit, ProfileViewState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: CircularProgressIndicator(),
                  ),

                  error: (message) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Text(message),
                  ),

                  loaded: (user, mode) => Column(
                    children: [
                      /// BASIC PROFILE
                      ProfileHeaderView(
                        firstName: user.basicDetails?.firstName ?? '',
                        lastName: user.basicDetails?.secondName ?? '',
                        username: user.username,
                        country: user.basicDetails?.country ?? '',
                        bio: user.bio ?? '',
                        profileImage:
                            user.basicDetails?.profilePictureUrl ?? '',
                      ),

                      /// EDIT BUTTON (current user only)
                      if (mode == ProfileMode.currentUser)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 64,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                            child: const Text('Edit profile'),
                          ),
                        ),

                      const SizedBox(height: 24),

                      SpiritualMastersView(items: spiritualMasters),
                    ],
                  ),
                );
              },
            ),

            /// 👇 POSTS ARE OUTSIDE CUBIT (STATIC)
            const SizedBox(height: 32),

            PostGridView(posts: posts),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
