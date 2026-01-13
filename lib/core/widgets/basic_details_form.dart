import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/chip_selector_form_field.dart';
import 'package:mandalahearts/core/widgets/date_picker.dart';

class BasicDetailsForm extends StatelessWidget {
  const BasicDetailsForm({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.onDobChanged,
    required this.onOptionChanged,
    this.initialDob,
    this.initialOption,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  final ValueChanged<DateTime?> onDobChanged;
  final ValueChanged<String?> onOptionChanged;

  final DateTime? initialDob;
  final String? initialOption;

  static const List<ChipOption<String>> _genderOptions = [
    ChipOption(value: 'male', label: 'Male'),
    ChipOption(value: 'female', label: 'Female'),
    ChipOption(value: 'non_binary', label: 'Non-binary'),
    ChipOption(value: 'prefer_not_say', label: 'Prefer not to say'),
  ];

  ChipOption<String>? _mapGenderToOption(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      return _genderOptions.firstWhere((o) => o.value == value);
    } catch (_) {
      return null; // ✅ safe fallback
    }
  }

  int _calculateAge(DateTime dob) {
    final today = DateTime.now();
    int age = today.year - dob.year;

    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(labelText: 'First name'),
            validator: (v) =>
                v == null || v.isEmpty ? 'First name is required' : null,
          ),

          const SizedBox(height: 20),

          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(labelText: 'Last name'),
            validator: (v) =>
                v == null || v.isEmpty ? 'Last name is required' : null,
          ),

          const SizedBox(height: 20),

          DatePicker(
            initialDate: initialDob,
            onChanged: onDobChanged,
            validator: (date) {
              if (date == null) return 'Date of birth is required';
              if (_calculateAge(date) < 16) {
                return 'You must be at least 16 years old';
              }
              return null;
            },
          ),

          const SizedBox(height: 32),

          ChipSelectorFormField<String>(
            label: 'Gender',
            options: _genderOptions,

            /// ✅ SAFE: null when empty or invalid
            initialValue: _mapGenderToOption(initialOption),

            validator: (v) => v == null ? 'Select your gender' : null,

            /// MODEL → VALUE
            onChanged: (option) {
              onOptionChanged(option?.value);
            },
          ),
        ],
      ),
    );
  }
}
