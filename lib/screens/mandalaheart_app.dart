import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/features/auth/bloc/auth_bloc.dart';
import 'package:mandalahearts/features/auth/bloc/auth_state.dart';
import 'package:mandalahearts/features/auth/enums/user_profile_state.dart';
import 'package:mandalahearts/screens/onboarding_screen.dart';
import 'package:mandalahearts/screens/splash_screen.dart';

class MandalaHeartsApp extends StatelessWidget {
  const MandalaHeartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (profileState) {
            AppRoute navigateTo = AppRoute.dashboard;
            if (profileState == UserProfileState.noProfile) {
              navigateTo = AppRoute.username;
            }
            if (profileState == UserProfileState.noBasicDetails) {
              navigateTo = AppRoute.addProfile;
            }
            router.go(navigateTo.path);
          },
        );
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            unauthenticated: () => OnBoardingScreen(),
            orElse: () => SplashScreen(),
          );
        },
      ),
    );
  }
}
