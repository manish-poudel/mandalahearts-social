import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/auth/bloc/auth_bloc.dart';
import 'package:mandalahearts/auth/bloc/auth_state.dart';
import 'package:mandalahearts/screens/onboarding_screen.dart';
import 'package:mandalahearts/screens/splash_screen.dart';

class MandalaHeartApp extends StatelessWidget {
  const MandalaHeartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (hasProfile) {
            hasProfile
                ? router.pushReplacement("/dashboard")
                : router.pushReplacement("/addprofile");
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
