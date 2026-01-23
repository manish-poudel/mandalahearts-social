import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/app_tooltip.dart';
import 'package:mandalahearts/core/widgets/basic_profile_view.dart';
import 'package:mandalahearts/core/widgets/post_grid_view.dart';
import 'package:mandalahearts/core/widgets/spiritual_master_view.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_cubit.dart'
    show ProfileViewCubit;
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_state.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            BlocBuilder<ProfileViewCubit, ProfileViewState>(
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
                  loaded: (user, mode) {
                    final spiritualMasters = user.spiritualMasters;

                    final bool hasMasters =
                        spiritualMasters != null && spiritualMasters.isNotEmpty;

                    return Column(
                      children: [
                        ProfileHeaderView(
                          firstName: user.basicDetails?.firstName ?? '',
                          lastName: user.basicDetails?.secondName ?? '',
                          username: user.username,
                          country: user.basicDetails?.country ?? '',
                          bio: user.bio ?? '',
                          profileImage:
                              user.basicDetails?.profilePictureUrl ?? '',
                        ),

                        if (mode == ProfileMode.currentUser)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: OutlinedButton(
                              onPressed: () {
                                context.push(AppRoute.editProfileScreen.path);
                              },
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

                        /// ===== SPIRITUAL MASTERS HEADER =====
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Spiritual Masters',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InfoTooltip(
                                  durationSeconds: 3,
                                  message:
                                      'Adding spiritual masters can help personalize your feed and let others understand your journey better.',
                                  child: const Icon(
                                    Icons.info_outline,
                                    size: 20,
                                  ),
                                ),
                              ),

                              /// Edit is ALWAYS visible for current user
                              if (mode == ProfileMode.currentUser)
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    size: 20,
                                  ),
                                  tooltip: 'Add spiritual masters',
                                  onPressed: () {
                                    context.push(
                                      AppRoute.addSpiritualMater.path,
                                    );
                                    // navigate to add/edit spiritual masters
                                  },
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        if (!hasMasters)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'No spiritual master added yet.\n'
                              'Use the add icon above to add one.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant
                                    .withAlpha(140),
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          SpiritualMastersView(
                            spiritualMasters: spiritualMasters,
                          ),
                      ],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 32),

            PostGridView(posts: posts),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

void showAddSpiritualMasterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final theme = Theme.of(context);
      final height = MediaQuery.of(context).size.height;

      return Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Container(
          height: height * 0.88,
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                /// Grab handle
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                /// Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      Text(
                        'Add Spiritual Master',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 1),

                /// Form area
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fill in the details below to add a spiritual master.',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),

                        /// Master Name
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Master Name',
                            labelStyle: theme.textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Master Name
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Master Name',
                            labelStyle: theme.textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Master Name
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Master Name',
                            labelStyle: theme.textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Affiliation
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Affiliation',
                            labelStyle: theme.textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Description
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: theme.textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // handle save
                            },
                            child: const Text('Save'),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
