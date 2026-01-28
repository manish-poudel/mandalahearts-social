import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/force_update.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/features/app_lifecycle/bloc/app_lifecycle_bloc.dart';
import 'package:mandalahearts/features/app_lifecycle/bloc/app_lifecycle_state.dart';
import 'package:mandalahearts/features/app_lifecycle/enums/user_profile_state.dart';
import 'package:mandalahearts/screens/onboarding_screen.dart';
import 'package:mandalahearts/screens/splash_screen.dart';
import 'package:mandalahearts/screens/username_screen.dart';
import 'package:mandalahearts/screens/add_profile_screen.dart';
import 'package:mandalahearts/screens/dashboard_screen.dart';
import 'package:mandalahearts/features/post_feed/cubit/public_post_feed_cubit.dart';
import 'package:mandalahearts/features/profile/add_profile/cubits/add_profile_cubit.dart';
import 'package:mandalahearts/features/username/cubits/username_cubits.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mandalahearts/core/services/firestore/firestore_username_service.dart';

class MandalaHeartsApp extends StatelessWidget {
  const MandalaHeartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLifeCycleBloc, AppLifeCycleState>(
      builder: (context, state) {
        return state.maybeWhen(
          unauthenticated: () => OnBoardingScreen(),
          authenticated: (profileState) {
            if (profileState == UserProfileState.noProfile) {
              return BlocProvider(
                create: (_) => UsernameCubit(
                  usernameDB: FirestoreUsernameService(
                    FirebaseFirestore.instance,
                  ),
                ),
                child: const UsernameScreen(),
              );
            } else if (profileState == UserProfileState.noBasicDetails) {
              return BlocProvider(
                create: (_) => ProfileDetailsCubit(
                  auth: FirebaseAuth.instance,
                  userRepository: context.read<AppUserRepository>(),
                )..load(),
                child: const ProfileDetailsScreen(),
              );
            } else {
              return BlocProvider(
                create: (context) =>
                    PublicPostFeedCubit(context.read<PostRepository>())
                      ..loadInitial(),
                child: DashboardScreen(),
              );
            }
          },
          forceUpdate: (message, link) =>
              ForceUpdateScreen(message: message, link: link),
          orElse: () => SplashScreen(),
        );
      },
    );
  }
}
