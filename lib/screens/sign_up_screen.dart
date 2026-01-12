import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/widgets/ui/agree_to_signup.dart';
import 'package:mandalahearts/widgets/ui/google_button.dart';
import 'package:mandalahearts/widgets/ui/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final router = GoRouter.of(context);

    InputDecoration inputDecoration({
      required String label,
      Widget? suffixIcon,
    }) {
      return InputDecoration(labelText: label);
    }

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
                Text(
                  'Sign up',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                /// SIGN IN LINK
                Row(
                  children: [
                    Text('or ', style: textTheme.bodyMedium),
                    GestureDetector(
                      onTap: () {
                        context.replace('/sign_in');
                      },
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

                const SizedBox(height: 32),

                /// EMAIL
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration(label: 'Email'),
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                TextField(
                  obscureText: _obscurePassword,
                  decoration: inputDecoration(
                    label: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// CONFIRM PASSWORD
                TextField(
                  obscureText: _obscureConfirmPassword,
                  decoration: inputDecoration(
                    label: 'Confirm password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                AgreeToSignUp(textAlign: TextAlign.start),

                const SizedBox(height: 16),

                /// AGREE & JOIN BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Agree & Join',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// OR DIVIDER
                const OrDivider(),

                const SizedBox(height: 20),

                /// GOOGLE SIGN-UP
                GoogleButton(
                  text: 'Continue with Google',
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
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
