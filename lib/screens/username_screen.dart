import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/username_form.dart';
import 'package:mandalahearts/features/username/cubits/username_cubits.dart';
import 'package:mandalahearts/features/username/cubits/username_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthRepository>().signOut();
              context.go(AppRoute.mandalaHeartApp.path);
            },
            child: Text(
              "Logout",
              style: TextStyle(color: colorScheme.onSurface.withAlpha(180)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<UsernameCubit, UsernameState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                context.pushReplacement(AppRoute.mandalaHeartApp.path);
              },
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            final errorMessage = state.maybeWhen(
              error: (message) => message,
              orElse: () => null,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a username",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Pick a unique username for your profile. You can change it later.",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                UsernameForm(
                  formKey: _formKey,
                  controller: _usernameController,
                  errorMessage: errorMessage,
                  isLoading: isLoading,
                  buttonText: 'Save Username',
                  onSubmit: () {
                    if (_formKey.currentState!.validate()) {
                      final username = _usernameController.text
                          .trim()
                          .toLowerCase();
                      context.read<UsernameCubit>().saveUsername(username);
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
