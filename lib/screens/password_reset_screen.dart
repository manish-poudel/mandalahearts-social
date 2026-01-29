import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandalahearts/features/password_reset/cubit/password_reset_cubit.dart';
import 'package:mandalahearts/models/async/async_state.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
                  'Reset password',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                /// SUBTITLE
                Text(
                  'Enter your email and we’ll send you a reset link.',
                  style: textTheme.bodyMedium,
                ),

                const SizedBox(height: 21),

                /// EMAIL FIELD (same look as SignIn)
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 28),

                /// SUBMIT BUTTON
                BlocConsumer<PasswordResetCubit, AsyncState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password reset link sent! Check your email.',
                            ),
                          ),
                        );
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
                        onPressed: state.maybeWhen(
                          loading: () => null,
                          orElse: () => () {
                            if (!_formKey.currentState!.validate()) return;
                            context
                                .read<PasswordResetCubit>()
                                .sendPasswordReset(
                                  _emailController.text.trim(),
                                );
                          },
                        ),
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
                            'Send reset link',
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
