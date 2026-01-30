import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/add_spiritual_master.dart';
import 'package:mandalahearts/core/widgets/app_tooltip.dart';
import 'package:mandalahearts/core/widgets/basic_profile_view.dart';
import 'package:mandalahearts/core/widgets/custom_network_image.dart';
import 'package:mandalahearts/core/widgets/spiritual_master_view.dart';
import 'package:mandalahearts/core/widgets/verification_banner.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/post_feed/cubit/private_post_feed_cubit.dart';
import 'package:mandalahearts/features/post_feed/state/post_feed_state.dart';
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_cubit.dart';
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_state.dart';
import 'package:mandalahearts/features/spiritual_masters/add/cubit/add_spiritual_master_cubit.dart';
import 'package:mandalahearts/repository/app_config_repository.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';
import 'package:mandalahearts/repository/spiritual_master_repository.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          BlocBuilder<ProfileViewCubit, ProfileViewState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user, mode, _) {
                  if (mode == ProfileMode.currentUser) {
                    return IconButton(
                      icon: const Icon(Icons.settings_outlined),
                      onPressed: () {
                        context.push(AppRoute.settingScreen.path);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
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
              loaded: (user, mode, isAccountVerified) {
                final spiritualMasters = user.spiritualMasters;
                final bool hasMasters =
                    spiritualMasters != null && spiritualMasters.isNotEmpty;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// --- 2. Profile Header ---
                    ProfileHeaderView(
                      firstName: user.basicDetails?.firstName ?? '',
                      lastName: user.basicDetails?.secondName ?? '',
                      username: user.username,
                      country: user.basicDetails?.country ?? '',
                      bio: user.bio ?? '',
                      profileImage: user.basicDetails?.profilePictureUrl ?? '',
                    ),

                    /// --- 3. Edit Profile Action ---
                    if (mode == ProfileMode.currentUser)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentGeometry.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: OutlinedButton(
                              onPressed: () =>
                                  context.push(AppRoute.editProfileScreen.path),
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
                      ),

                    const SizedBox(height: 24),

                    /// --- 1. Email Verification Banner (Top-most) ---
                    if (mode == ProfileMode.currentUser &&
                        isAccountVerified == false)
                      VerificationBanner(
                        onResend: () {
                          context.read<AuthRepository>().sendVerification();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Verification link has been sent to your email!',
                              ),
                            ),
                          );
                        },
                      ),

                    /// --- 4. Spiritual Masters ---
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

                                // if (mode == ProfileMode.currentUser)
                                //   Padding(
                                //     padding: const EdgeInsets.only(right: 8),
                                //     child: InfoTooltip(
                                //       durationSeconds: 3,
                                //       message:
                                //           'Adding spiritual masters can help personalize your feed and let others understand your journey better.',
                                //       child: const Icon(
                                //         Icons.info_outline,
                                //         size: 20,
                                //       ),
                                //     ),
                                //   ),
                                if (mode == ProfileMode.currentUser)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      size: 20,
                                    ),
                                    onPressed: () =>
                                        _openSpiritualMasterBottomSheet(
                                          context,
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          if (hasMasters)
                            SpiritualMastersView(
                              spiritualMasters: spiritualMasters,
                              onDelete: mode == ProfileMode.currentUser
                                  ? (master) => context
                                        .read<ProfileViewCubit>()
                                        .deleteSpiritualMaster(master)
                                  : null,
                            ),
                        ],
                      ),

                    const SizedBox(height: 32),

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

  void _openSpiritualMasterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: BlocProvider(
          create: (_) => AddSpiritualMasterCubit(
            repository: context.read<SpiritualMasterRepository>(),
            appUserRepository: context.read<AppUserRepository>(),
            appConfigRepository: context.read<AppConfigRepository>(),
          )..loadMasters(),
          child: const AddSpiritualMaster(),
        ),
      ),
    );
  }
}
