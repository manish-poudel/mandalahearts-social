import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/google_button.dart';
import 'package:mandalahearts/core/widgets/or_divider.dart';
import 'package:mandalahearts/features/sign_in/cubits/sign_in_cubit.dart';
import 'package:mandalahearts/features/sign_in/cubits/sign_in_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/core/widgets/agree_to_signup.dart';
import 'package:mandalahearts/core/widgets/email_password_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final router = GoRouter.of(context);
    return Scaffold(
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

                /// TITLE
                Text(
                  'Sign in',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                /// JOIN LINK
                Row(
                  children: [
                    Text('or ', style: textTheme.bodyMedium),
                    GestureDetector(
                      onTap: () {
                        context.replace(AppRoute.signUp.path);
                      },
                      child: Text(
                        'Join MandalaHearts',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                /// GOOGLE SIGN-IN
                GoogleButton(
                  text: 'Sign in with Google',
                  borderRadius: 24,
                  onPressed: () async {
                    UserCredential userCredential = await context
                        .read<AuthRepository>()
                        .signInWithGoogle();
                    if (userCredential.user != null) {
                      router.pop();
                    }
                  },
                ),

                const SizedBox(height: 12),

                /// LEGAL TEXT
                AgreeToSignUp(
                  text: "By clicking Continue, you agree to MandalaHearts ",
                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 24),

                /// OR DIVIDER
                const OrDivider(),
                const SizedBox(height: 24),

                /// EMAIL + PASSWORD FORM
                EmailPasswordForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  showConfirmPassword: false,
                ),

                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    context.push(AppRoute.passwordResetScreen.path);
                  },
                  child: Text(
                    'Forgot password?',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                /// CONTINUE BUTTON
                BlocConsumer<SignInCubit, SignInState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: () {
                        router.pop();
                      },
                      error: (message) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          context.read<SignInCubit>().signInWithEmail(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                        },
                        child: state.maybeWhen(
                          loading: () => SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: colorScheme.surface,
                              strokeWidth: 2,
                            ),
                          ),
                          orElse: () => Text(
                            'Continue',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
