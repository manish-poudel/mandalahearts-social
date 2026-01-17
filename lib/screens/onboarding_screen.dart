import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/app_logo.dart';
import 'package:mandalahearts/core/widgets/google_button.dart';
import 'package:mandalahearts/core/widgets/icon_text_button.dart';
import 'package:mandalahearts/core/widgets/or_divider.dart';
import 'package:mandalahearts/enums/app_release_tag.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/core/widgets/agree_to_signup.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final authRepo = context.read<AuthRepository>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              /// TOP CONTENT
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(tag: AppReleaseTag.beta),

                    const SizedBox(height: 4),

                    const SizedBox(height: 60),

                    /// FEATURES
                    Column(
                      children: [
                        Text(
                          'Join a community of people seeking spiritual growth',
                          textAlign: TextAlign.center,
                          style: textTheme.titleLarge?.copyWith(fontSize: 19),
                        ),
                        const SizedBox(height: 8),
                        // Text(
                        //   'Meditative Posts • Spiritual News • Tools & Support',
                        //   textAlign: TextAlign.center,
                        //   style: textTheme.bodySmall?.copyWith(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 12),

                    /// GOOGLE
                    GoogleButton(
                      text: 'Continue with Google',
                      borderRadius: 24,
                      onPressed: () {
                        authRepo.signInWithGoogle();
                      },
                    ),

                    const SizedBox(height: 12),

                    IconTextButton(
                      onPressed: () {
                        context.push(AppRoute.signIn.path);
                      },
                      text: 'Sign in with email',
                      icon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      textStyle: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.25,
                      ),
                    ),

                    /// EMAIL
                    const SizedBox(height: 18),

                    OrDivider(),

                    const SizedBox(height: 18),

                    /// JOIN NOW
                    GestureDetector(
                      onTap: () {
                        context.push("/sign_up");
                      },
                      child: RichText(
                        text: TextSpan(
                          style: textTheme.bodyMedium,
                          children: [
                            const TextSpan(
                              text: 'New to MandalaHearts? ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: 'Join now',
                              style: TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),
                    AgreeToSignUp(),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
