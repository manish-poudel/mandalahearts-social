import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandalahearts/app/app_routes.dart';
import 'package:mandalahearts/core/widgets/basic_details_form.dart';
import 'package:mandalahearts/features/profile/cubits/profile_cubit.dart';
import 'package:mandalahearts/features/profile/cubits/profile_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  DateTime? _dob;
  String? _selectedOption;

  bool _didAutofill = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final dob = _dob!;
    final option = _selectedOption!;

    context.read<ProfileDetailsCubit>().save(
      firstName: firstName,
      lastName: lastName,
      dob: dob,
      gender: option,
    );
  }

  void _autofillOnce(ProfileDetailsState state) {
    if (_didAutofill) return;

    final user = state.maybeWhen(
      ready: (user) => user,
      success: (user) => user,
      error: (_, user) => user,
      orElse: () => null,
    );

    final basic = user?.basicDetails;
    if (basic != null) {
      _firstNameController.text = basic.firstName;
      _lastNameController.text = basic.secondName;
      _dob = basic.dob;
      _selectedOption = basic.gender;
      _didAutofill = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
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
              'Logout',
              style: TextStyle(color: colorScheme.onSurface.withAlpha(180)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocConsumer<ProfileDetailsCubit, ProfileDetailsState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (user) {
                  context.go(AppRoute.mandalaHeartApp.path);
                },
              );
            },
            builder: (context, state) {
              final errorMessage = state.maybeWhen(
                error: (message, _) => message,
                orElse: () => null,
              );

              final isSaving = state.maybeWhen(
                saving: (_) => true,
                orElse: () => false,
              );

              return state.maybeWhen(
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                orElse: () {
                  _autofillOnce(state);

                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Basic details',
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please provide your basic details',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),

                        const SizedBox(height: 32),

                        BasicDetailsForm(
                          formKey: _formKey,
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                          initialDob: _dob,
                          initialOption: _selectedOption,
                          onDobChanged: (date) => _dob = date,
                          onOptionChanged: (value) => _selectedOption = value,
                        ),

                        const SizedBox(height: 24),

                        if (errorMessage != null) ...[
                          Text(
                            errorMessage,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.error,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],

                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: isSaving ? null : _submit,
                            child: isSaving
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: colorScheme.onPrimary,
                                      strokeWidth: 1.5,
                                    ),
                                  )
                                : Text(
                                    'Continue',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
