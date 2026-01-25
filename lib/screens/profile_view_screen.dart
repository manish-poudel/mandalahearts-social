import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/add_spiritual_master.dart';
import 'package:mandalahearts/core/widgets/app_tooltip.dart';
import 'package:mandalahearts/core/widgets/basic_profile_view.dart';
import 'package:mandalahearts/core/widgets/spiritual_master_view.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/post_feed/cubit/private_post_feed_cubit.dart';
import 'package:mandalahearts/features/post_feed/state/post_feed_state.dart';
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_cubit.dart'
    show ProfileViewCubit;
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
      backgroundColor: Colors.transparent, // so your container shape is visible
      builder: (context) {
        final height = MediaQuery.of(context).size.height;

        return Container(
          width: double.infinity, // full width
          height: height * 0.7, // almost full height
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: BlocProvider(
            create: (_) => AddSpiritualMasterCubit(
              repository: context.read<SpiritualMasterRepository>(),
              appUserRepository: context.read<AppUserRepository>(),
            )..loadMasters(),
            child: AddSpiritualMaster(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            BlocBuilder<ProfileViewCubit, ProfileViewState>(
              builder: (context, state) {
                return state.when(
                  loading: () => Center(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: CircularProgressIndicator(),
                    ),
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
                              if (mode == ProfileMode.currentUser)
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
                                    _openSpiritualMasterBottomSheet(context);
                                  },
                                ),
                            ],
                          ),
                        ),

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
                          Padding(
                            padding: EdgeInsets.only(
                              top: mode == ProfileMode.currentUser ? 0.0 : 8.0,
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

                        const SizedBox(height: 32),

                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 21),
                          child: BlocProvider(
                            create: (_) => CreatorPostFeedCubit(
                              creatorId: user.uid,
                              repository: context.read<PostRepository>(),
                              profileMode: mode,
                            )..loadInitial(),
                            child: BlocBuilder<CreatorPostFeedCubit, PostFeedState>(
                              builder: (context, state) {
                                final cubit = context
                                    .read<CreatorPostFeedCubit>();

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Posts',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const SizedBox(height: 16),

                                    // Loading indicator
                                    if (state is PostFeedLoading)
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),

                                    // GridView when loaded
                                    if (state is PostFeedLoaded)
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
                                              final post =
                                                  state.items[index].post;
                                              return GestureDetector(
                                                onTap: () async {
                                                  final deleted = await context
                                                      .push(
                                                        AppRoute
                                                            .postViewScreen
                                                            .path,
                                                        extra:
                                                            state.items[index],
                                                      );
                                                  if (deleted == true) {
                                                    cubit.removePost(
                                                      state
                                                          .items[index]
                                                          .post
                                                          .id,
                                                    );
                                                  }
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    post.imageUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),

                                          const SizedBox(height: 12),

                                          // Load more button
                                          if (state.hasMore)
                                            Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  cubit.loadMore();
                                                },
                                                child: Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                  ),
                                                  child: state.isLoadingMore
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                6.0,
                                                              ),
                                                          child:
                                                              CircularProgressIndicator(
                                                                strokeWidth: 2,
                                                              ),
                                                        )
                                                      : const Icon(
                                                          Icons.add,
                                                          size: 20,
                                                          color: Colors.grey,
                                                        ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),

                                    // Error handling
                                    if (state is PostFeedInitialError)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        child: Center(
                                          child: Text(
                                            state.message,
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      theme.colorScheme.error,
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
          ],
        ),
      ),
    );
  }
}
