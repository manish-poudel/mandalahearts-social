import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/features/sign_up/cubits/sign_up_cubit.dart';
import 'package:mandalahearts/features/sign_up/cubits/sign_up_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/core/widgets/agree_to_signup.dart';
import 'package:mandalahearts/core/widgets/email_password_form.dart';
import 'package:mandalahearts/core/widgets/google_button.dart';
import 'package:mandalahearts/core/widgets/or_divider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final router = GoRouter.of(context);

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.pop();
          },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),

                  Text(
                    'Sign up',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Text('or ', style: textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () => context.replace(AppRoute.signIn.path),
                        child: Text(
                          'Sign in to MandalaHearts',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  EmailPasswordForm(
                    formKey: _formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    showConfirmPassword: true,
                  ),

                  const SizedBox(height: 28),
                  AgreeToSignUp(textAlign: TextAlign.start),
                  const SizedBox(height: 16),

                  /// ✅ BUTTON (FIXED)
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  context.read<SignUpCubit>().signUpWithEmail(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                                },
                          child: isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: colorScheme.surface,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Agree & Join',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                  const OrDivider(),
                  const SizedBox(height: 20),

                  GoogleButton(
                    text: 'Continue with Google',
                    borderRadius: 24,
                    onPressed: () async {
                      final userCredential = await context
                          .read<AuthRepository>()
                          .signInWithGoogle();

                      if (userCredential.user != null) {
                        router.pop();
                      }
                    },
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
