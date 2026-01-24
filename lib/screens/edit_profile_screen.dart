import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mandalahearts/app/app_routes.dart';
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
      bio: _bioController.text.trim(),
    );
  }

  void _autofillOnce(EditProfileState state) {
    if (_didAutofill) return;

    state.whenOrNull(
      loaded: (user, _, _, _) {
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

  void _saveProfileImage(Uint8List image) {
    context.read<EditProfileCubit>().saveProfileImage(image: image);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final tt = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile')),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) => {
          state.whenOrNull(
            loaded: (_, _, _, basicDetailSaved) {
              if (basicDetailSaved) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Profile updated")));
              }
            },
          ),
        },
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (m) => Center(child: Text(m)),
            loaded: (user, isSavingBasicDetails, isSavingProfileImage, _) {
              _autofillOnce(state);
              return SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    /// Avatar
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final selectedImage = await context
                                  .push<Uint8List?>(AppRoute.photoPicker.path);
                              if (selectedImage != null) {
                                _saveProfileImage(selectedImage);
                              }
                            },
                            child: ProfileAvatar(
                              imageUrl:
                                  user.basicDetails?.profilePictureUrl ?? '',
                              radius: 48,
                            ),
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

                    /// ---------------- Basic Details ----------------
                    Container(
                      decoration: BoxDecoration(
                        color: cs.primaryContainer.withAlpha(2),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(16),
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
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _bioController,
                              maxLength: 150,
                              maxLines: null,
                              decoration: const InputDecoration(
                                labelText: 'Bio',
                              ),
                            ),
                            const SizedBox(height: 24),
                            Align(
                              alignment: Alignment.center,
                              child: OutlinedButton(
                                onPressed: isSavingBasicDetails
                                    ? null
                                    : _saveBasicDetails,
                                child: isSavingBasicDetails
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
