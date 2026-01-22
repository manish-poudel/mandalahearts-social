import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/basic_details_form.dart';
import 'package:mandalahearts/core/widgets/profile_avatar.dart';
import 'package:mandalahearts/features/profile/edit_profile/cubits/edit_profile_cubit.dart';
import 'package:mandalahearts/features/profile/edit_profile/cubits/edit_profile_state.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _basicFormKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();

  DateTime? _dob;
  String? _country;

  bool _didAutofill = false;

  void _saveBasicDetails() {
    final isValid = _basicFormKey.currentState?.validate() ?? false;
    if (!isValid) return;

    context.read<EditProfileCubit>().saveBasicDetails(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      dob: _dob!,
      country: _country!,
    );
  }

  void _autofillOnce(EditProfileState state) {
    if (_didAutofill) return;

    state.whenOrNull(
      loaded: (user, _) {
        final basic = user.basicDetails;

        _usernameController.text = user.username;
        _bioController.text = user.bio ?? '';

        if (basic != null) {
          _firstNameController.text = basic.firstName;
          _lastNameController.text = basic.secondName;
          _dob = basic.dob;
          _country = basic.country;
        }

        _didAutofill = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final tt = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile')),
      body: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (m) => Center(child: Text(m)),
            loaded: (user, isSaving) {
              _autofillOnce(state);

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    /// Avatar
                    Center(
                      child: Column(
                        children: [
                          ProfileAvatar(
                            imageUrl:
                                user.basicDetails?.profilePictureUrl ?? '',
                            radius: 48,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Change profile photo',
                            style: TextStyle(color: cs.primary),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// ---------------- Bio ----------------
                    _Section(
                      color: cs.primaryContainer.withAlpha(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionHeader(
                            title: 'Bio',
                            action: TextButton(
                              onPressed: () {},
                              child: const Text('Save'),
                            ),
                          ),
                          TextFormField(
                            controller: _bioController,
                            readOnly: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// ---------------- Basic Details ----------------
                    _Section(
                      color: cs.primaryContainer.withAlpha(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Basic details',
                            style: tt.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Update your personal information',
                            style: tt.bodySmall?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 16),
                          BasicDetailsForm(
                            formKey: _basicFormKey,
                            firstNameController: _firstNameController,
                            lastNameController: _lastNameController,
                            initialDob: _dob,
                            initialCountry: _country,
                            onDobChanged: (d) => _dob = d,
                            onCountryChanged: (c) => _country = c,
                          ),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.center,
                            child: OutlinedButton(
                              onPressed: isSaving ? null : _saveBasicDetails,
                              child: isSaving
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 120),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// ---------------- Helpers ----------------

class _Section extends StatelessWidget {
  final Widget child;
  final Color color;

  const _Section({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Widget action;

  const _SectionHeader({required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        action,
      ],
    );
  }
}
