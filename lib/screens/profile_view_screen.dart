import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';

import 'package:mandalahearts/core/widgets/add_spiritual_master.dart';
import 'package:mandalahearts/core/widgets/app_tooltip.dart';
import 'package:mandalahearts/core/widgets/basic_profile_view.dart';
import 'package:mandalahearts/core/widgets/custom_network_image.dart';
import 'package:mandalahearts/core/widgets/spiritual_master_view.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/auth/bloc/auth_bloc.dart';
import 'package:mandalahearts/features/auth/bloc/auth_event.dart';
import 'package:mandalahearts/features/post_feed/cubit/private_post_feed_cubit.dart';
import 'package:mandalahearts/features/post_feed/state/post_feed_state.dart';
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_cubit.dart';
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_state.dart';
import 'package:mandalahearts/features/spiritual_masters/add/cubit/add_spiritual_master_cubit.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';
import 'package:mandalahearts/repository/spiritual_master_repository.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  void _openSpiritualMasterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final height = MediaQuery.of(context).size.height;

        return Container(
          height: height * 0.7,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: BlocProvider(
            create: (_) => AddSpiritualMasterCubit(
              repository: context.read<SpiritualMasterRepository>(),
              appUserRepository: context.read<AppUserRepository>(),
            )..loadMasters(),
            child: const AddSpiritualMaster(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'logout') {
                context.read<AuthBloc>().add(AuthEvent.signOut());
                Navigator.of(context).pop();
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 18),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: BlocBuilder<ProfileViewCubit, ProfileViewState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (message) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(child: Text(message)),
              ),
              loaded: (user, mode) {
                final spiritualMasters = user.spiritualMasters;
                final bool hasMasters =
                    spiritualMasters != null && spiritualMasters.isNotEmpty;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileHeaderView(
                      firstName: user.basicDetails?.firstName ?? '',
                      lastName: user.basicDetails?.secondName ?? '',
                      username: user.username,
                      country: user.basicDetails?.country ?? '',
                      bio: user.bio ?? '',
                      profileImage: user.basicDetails?.profilePictureUrl ?? '',
                    ),

                    if (mode == ProfileMode.currentUser)
                      Align(
                        alignment: AlignmentGeometry.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: OutlinedButton(
                            onPressed: () {
                              context.push(AppRoute.editProfileScreen.path);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 64,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                            child: const Text('Edit profile'),
                          ),
                        ),
                      ),

                    const SizedBox(height: 24),

                    /// ================= Spiritual Masters =================
                    if (hasMasters || mode == ProfileMode.currentUser)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Spiritual Masters',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),

                                if (mode == ProfileMode.currentUser)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
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

                                if (mode == ProfileMode.currentUser)
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      size: 20,
                                    ),
                                    tooltip: 'Add spiritual masters',
                                    onPressed: () {
                                      _openSpiritualMasterBottomSheet(context);
                                    },
                                  ),
                              ],
                            ),
                          ),

                          if (!hasMasters && mode == ProfileMode.currentUser)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              child: Text(
                                'No spiritual master added yet.\nUse the add icon above.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant
                                      .withAlpha(140),
                                  height: 1.4,
                                ),
                              ),
                            ),

                          if (hasMasters)
                            Padding(
                              padding: EdgeInsets.only(
                                top: mode == ProfileMode.currentUser ? 0 : 8,
                              ),
                              child: SpiritualMastersView(
                                spiritualMasters: spiritualMasters,
                                onDelete: mode == ProfileMode.currentUser
                                    ? (master) {
                                        context
                                            .read<ProfileViewCubit>()
                                            .deleteSpiritualMaster(master);
                                      }
                                    : null,
                              ),
                            ),
                        ],
                      ),

                    const SizedBox(height: 32),

                    /// ================= Posts =================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      child: BlocProvider(
                        create: (_) => CreatorPostFeedCubit(
                          creatorId: user.uid,
                          repository: context.read<PostRepository>(),
                          profileMode: mode,
                        )..loadInitial(),
                        child: BlocBuilder<CreatorPostFeedCubit, PostFeedState>(
                          builder: (context, state) {
                            final cubit = context.read<CreatorPostFeedCubit>();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Posts',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                if (state is PostFeedLoading)
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),

                                if (state is PostFeedLoaded &&
                                    state.items.isNotEmpty)
                                  Column(
                                    children: [
                                      GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: state.items.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 6,
                                              crossAxisSpacing: 6,
                                            ),
                                        itemBuilder: (_, index) {
                                          final post = state.items[index].post;
                                          return GestureDetector(
                                            onTap: () async {
                                              final deleted = await context
                                                  .push(
                                                    AppRoute
                                                        .postViewScreen
                                                        .path,
                                                    extra: state.items[index],
                                                  );
                                              if (deleted == true) {
                                                cubit.removePost(post.id);
                                              }
                                            },
                                            child: CustomNetworkImage(
                                              imageUrl: post.imageUrl,
                                            ),
                                          );
                                        },
                                      ),

                                      const SizedBox(height: 12),

                                      if (state.hasMore)
                                        Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              cubit.loadMore();
                                            },

                                            child: state.isLoadingMore
                                                ? const Padding(
                                                    padding: EdgeInsets.all(6),
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey
                                                            .shade400,
                                                      ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.add,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                    ],
                                  ),

                                if (state is PostFeedLoaded &&
                                    state.items.isEmpty)
                                  Align(
                                    alignment: AlignmentGeometry.center,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      child: Text(
                                        'No posts yet.',
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: theme
                                                  .colorScheme
                                                  .onSurfaceVariant
                                                  .withAlpha(140),
                                              height: 1.4,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
