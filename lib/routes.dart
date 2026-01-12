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
  initialLocation: '/onboarding',
  routes: <RouteBase>[
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return OnBoardingScreen();
      },
    ),
    GoRoute(
      name: 'sign_in',
      path: '/sign_in',
      builder: (BuildContext context, GoRouterState state) {
        return SignInScreen();
      },
    ),
    GoRoute(
      name: 'sign_up',
      path: '/sign_up',
      builder: (BuildContext context, GoRouterState state) {
        return SignUpScreen();
      },
    ),
  ],
);
