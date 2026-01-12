import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/auth/bloc/auth_bloc.dart';
import 'package:mandalahearts/auth/bloc/auth_state.dart';
import 'package:mandalahearts/screens/dashboard_screen.dart';
import 'package:mandalahearts/screens/onboarding_screen.dart';
import 'package:mandalahearts/screens/splash_screen.dart';

class MandalaHeartApp extends StatelessWidget {
  const MandalaHeartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SplashScreen(),
          loading: () => const SplashScreen(),
          unauthenticated: () => const OnBoardingScreen(),
          authenticated: (hasProfile) {
            return const DashboardScreen();
          },
        );
      },
    );
  }
}
