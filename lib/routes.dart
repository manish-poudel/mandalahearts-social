import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/auth/cubits/sign_in/sign_in_cubit.dart';
import 'package:mandalahearts/auth/cubits/sign_up/sign_up_cubit.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/screens/mandalaheart_app.dart';
import 'package:mandalahearts/screens/onboarding_screen.dart';
import 'package:mandalahearts/screens/sign_in_screen.dart';
import 'package:mandalahearts/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

/// The route configuration.
final GoRouter routes = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'mandalaheartapp',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MandalaHeartApp();
      },
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return OnBoardingScreen();
      },
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => SignInCubit(context.read<AuthRepository>()),
          child: const SignInScreen(),
        );
      },
    ),

    GoRoute(
      path: '/sign_up',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => SignUpCubit(context.read<AuthRepository>()),
          child: const SignUpScreen(),
        );
      },
    ),
  ],
);
