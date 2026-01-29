import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/google_button.dart';
import 'package:mandalahearts/features/account/cubit/delete_account_cubit.dart';
import 'package:mandalahearts/features/account/cubit/delete_account_state.dart';
import 'package:mandalahearts/models/async/async_state.dart';
import 'package:mandalahearts/repository/app_user_repository.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    _confirmController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _canConfirmDelete() {
    return _confirmController.text.trim().toUpperCase() == 'DELETE';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => DeleteAccountCubit(
        appUserRepository: context.read<AppUserRepository>(),
        authRepository: context.read<AuthRepository>(),
        postRepository: context.read<PostRepository>(),
      ),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        listener: (context, state) {
          state.whenOrNull(
            confirmDelete: (isGoogleUser, deleteState) {
              if (deleteState is AsyncSuccess) {
                context.read<AuthRepository>().signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Delete Account'),
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.onSurface,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Icon(
                        Icons.warning_amber_rounded,
                        size: 60,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Delete your account?',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'This action is permanent and cannot be undone.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // ---------- STATE-BASED UI ----------
                      state.when(
                        init: (isGoogleUser) {
                          // During init, show loading indicator
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        reauth: (isGoogleUser, loginState) {
                          final isLoading = loginState is AsyncLoading;
                          final errorMessage = loginState is AsyncError
                              ? loginState.message
                              : null;

                          return Column(
                            children: [
                              if (isGoogleUser)
                                GoogleButton(
                                  text: 'Sign in with Google to continue',
                                  onPressed: isLoading
                                      ? null
                                      : () {
                                          _confirmController.clear();
                                          context
                                              .read<DeleteAccountCubit>()
                                              .reauthGoogle();
                                        },
                                )
                              else
                                Column(
                                  children: [
                                    TextField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      enabled: !isLoading,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your password',
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 16,
                                              horizontal: 16,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    FilledButton(
                                      onPressed: isLoading
                                          ? null
                                          : () {
                                              final pwd = _passwordController
                                                  .text
                                                  .trim();
                                              context
                                                  .read<DeleteAccountCubit>()
                                                  .reauthEmail(pwd);
                                            },
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.green.shade700,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        minimumSize: const Size.fromHeight(48),
                                      ),
                                      child: isLoading
                                          ? const SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Text('Reauthenticate'),
                                    ),
                                  ],
                                ),
                              if (errorMessage != null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  errorMessage,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ],
                          );
                        },
                        confirmDelete: (isGoogleUser, deleteState) {
                          final isLoading = deleteState is AsyncLoading;
                          final errorMessage = deleteState is AsyncError
                              ? deleteState.message
                              : null;

                          // Always ask to type DELETE
                          return Column(
                            children: [
                              TextField(
                                controller: _confirmController,
                                obscureText: false,
                                textAlign: TextAlign.center,
                                enabled: !isLoading,
                                decoration: InputDecoration(
                                  hintText: 'Type DELETE to confirm',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 16,
                                  ),
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 48,
                                      child: OutlinedButton(
                                        onPressed: isLoading
                                            ? null
                                            : () => Navigator.pop(context),
                                        style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: const Text('Cancel'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: SizedBox(
                                      height: 48,
                                      child: FilledButton(
                                        onPressed:
                                            !isLoading && _canConfirmDelete()
                                            ? () => context
                                                  .read<DeleteAccountCubit>()
                                                  .deleteAccount()
                                            : null,
                                        style: FilledButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: isLoading
                                            ? const SizedBox(
                                                width: 24,
                                                height: 24,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : const Text('Delete'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (errorMessage != null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  errorMessage,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
