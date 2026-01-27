import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/services/firestore/firestore_username_service.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/features/auth/bloc/auth_bloc.dart';
import 'package:mandalahearts/features/auth/bloc/auth_event.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_cubit.dart';
import 'package:mandalahearts/features/post_feed/cubit/public_post_feed_cubit.dart';
import 'package:mandalahearts/features/profile/add_profile/cubits/add_profile_cubit.dart';
import 'package:mandalahearts/features/profile/edit_profile/cubits/edit_profile_cubit.dart';
import 'package:mandalahearts/features/profile/view_profile/cubits/profile_view_cubit.dart';
import 'package:mandalahearts/features/username/cubits/username_cubits.dart';
import 'package:mandalahearts/features/view_post/cubit/post_view_cubit.dart';
import 'package:mandalahearts/models/post_feed_item/post_feed_item.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';
import 'package:mandalahearts/screens/add_post_screen.dart';
import 'package:mandalahearts/screens/edit_profile_screen.dart';
import 'package:mandalahearts/screens/photo_picker_screen.dart';
import 'package:mandalahearts/screens/post_view_screen.dart';
import 'package:mandalahearts/screens/profile_view_screen.dart';

import 'package:mandalahearts/screens/sign_in_screen.dart';
import 'package:mandalahearts/screens/sign_up_screen.dart';
import 'package:mandalahearts/screens/dashboard_screen.dart';
import 'package:mandalahearts/screens/mandalaheart_app.dart';
import 'package:mandalahearts/screens/onboarding_screen.dart';
import 'package:mandalahearts/screens/add_profile_screen.dart';
import 'package:mandalahearts/features/sign_in/cubits/sign_in_cubit.dart';
import 'package:mandalahearts/features/sign_up/cubits/sign_up_cubit.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/screens/spiritual_master_screen.dart';
import 'package:mandalahearts/screens/username_screen.dart';

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return FadeTransition(opacity: animation, child: child);
         },
       );
}

List<RouteBase> appRoutes = <RouteBase>[
  GoRoute(
    name: AppRoute.mandalaHeartApp.name,
    path: AppRoute.mandalaHeartApp.path,
    builder: (BuildContext context, GoRouterState state) {
      return const MandalaHeartsApp();
    },
  ),
  GoRoute(
    name: AppRoute.onboarding.name,
    path: AppRoute.onboarding.path,
    builder: (BuildContext context, GoRouterState state) {
      return OnBoardingScreen();
    },
  ),
  GoRoute(
    name: AppRoute.signIn.name,
    path: AppRoute.signIn.path,
    builder: (context, state) {
      return BlocProvider(
        create: (_) => SignInCubit(context.read<AuthRepository>()),
        child: const SignInScreen(),
      );
    },
  ),
  GoRoute(
    name: AppRoute.signUp.name,
    path: AppRoute.signUp.path,
    builder: (context, state) {
      return BlocProvider(
        create: (_) => SignUpCubit(context.read<AuthRepository>()),
        child: const SignUpScreen(),
      );
    },
  ),
  GoRoute(
    name: AppRoute.username.name,
    path: AppRoute.username.path,
    builder: (context, state) {
      return BlocProvider(
        create: (_) => UsernameCubit(
          usernameDB: FirestoreUsernameService(FirebaseFirestore.instance),
        ),
        child: const UsernameScreen(),
      );
    },
  ),
  GoRoute(
    name: AppRoute.addProfile.name,
    path: AppRoute.addProfile.path,
    builder: (context, state) {
      return BlocProvider(
        create: (_) => ProfileDetailsCubit(
          auth: FirebaseAuth.instance,
          userRepository: context.read<AppUserRepository>(),
        )..load(),
        child: const ProfileDetailsScreen(),
      );
    },
  ),
  GoRoute(
    name: AppRoute.dashboard.name,
    path: AppRoute.dashboard.path,
    builder: (context, state) => BlocProvider(
      create: (context) =>
          PublicPostFeedCubit(context.read<PostRepository>())..loadInitial(),
      child: DashboardScreen(),
    ),
  ),
  GoRoute(
    name: AppRoute.addPostScreen.name,
    path: AppRoute.addPostScreen.path,
    builder: (context, state) => BlocProvider(
      create: (context) => PhotoPickerCubit(),
      child: AddPostScreen(),
    ),
  ),

  GoRoute(
    name: AppRoute.photoPicker.name,
    path: AppRoute.photoPicker.path,
    builder: (context, state) => BlocProvider(
      create: (context) => PhotoPickerCubit(),
      child: Scaffold(body: PhotoPickerScreen()),
    ),
  ),

  GoRoute(
    name: AppRoute.profileViewScreen.name,
    path: AppRoute.profileViewScreen.path,
    builder: (context, state) {
      final userId = context.read<AppUserRepository>().currentUser!.uid;
      return BlocProvider(
        create: (context) =>
            ProfileViewCubit(context.read<AppUserRepository>())
              ..init(userId: userId, mode: ProfileMode.currentUser),
        child: const ProfileViewScreen(),
      );
    },
  ),

  GoRoute(
    name: AppRoute.publicProfileViewScreen.name,
    path: AppRoute.publicProfileViewScreen.path,
    builder: (context, state) {
      final userId = state.pathParameters['userId']!;

      return BlocProvider(
        create: (context) =>
            ProfileViewCubit(context.read<AppUserRepository>())
              ..init(userId: userId, mode: ProfileMode.publicUser),
        child: const ProfileViewScreen(),
      );
    },
  ),

  GoRoute(
    name: AppRoute.editProfileScreen.name,
    path: AppRoute.editProfileScreen.path,
    builder: (context, state) {
      return BlocProvider(
        create: (context) =>
            EditProfileCubit(userRepository: context.read<AppUserRepository>())
              ..prepare(),
        child: const EditProfileScreen(),
      );
    },
  ),
  GoRoute(
    name: AppRoute.addSpiritualMater.name,
    path: AppRoute.addSpiritualMater.path,
    pageBuilder: (context, state) {
      return MaterialPage(child: SpiritualMasterScreen.add());
    },
  ),

  GoRoute(
    name: AppRoute.postViewScreen.name,
    path: AppRoute.postViewScreen.path,
    pageBuilder: (context, state) {
      final post = state.extra as PostFeedItem;
      final currentUserId = context.read<AuthRepository>().currentUser?.uid;

      return MaterialPage(
        child: BlocProvider(
          create: (_) => PostViewCubit(
            post: post,
            currentUserId: currentUserId!,
            repository: context.read<PostRepository>(),
          ),
          child: const PostViewScreen(),
        ),
      );
    },
  ),
];


/// The route configuration

