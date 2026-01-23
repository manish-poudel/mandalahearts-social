import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/country_selector.dart';
import 'package:mandalahearts/core/widgets/date_picker.dart';

class BasicDetailsForm extends StatelessWidget {
  const BasicDetailsForm({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.onDobChanged,
    required this.onCountryChanged,
    this.initialDob,
    this.initialCountry,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  final ValueChanged<DateTime?> onDobChanged;
  final ValueChanged<String?> onCountryChanged;

  final DateTime? initialDob;
  final String? initialCountry;

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
          /// First Name
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(labelText: 'First name'),
            validator: (v) =>
                v == null || v.isEmpty ? 'First name is required' : null,
          ),

          const SizedBox(height: 20),

          /// Last Name
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(labelText: 'Last name'),
            validator: (v) =>
                v == null || v.isEmpty ? 'Last name is required' : null,
          ),

          const SizedBox(height: 20),

          /// Date of Birth
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

          const SizedBox(height: 20),
          CountrySelector(
            initialCountry: countries
                .firstWhere((c) => c.name == initialCountry)
                .code,
            onCountryChanged: (country) => onCountryChanged(country?.name),
          ),
        ],
      ),
    );
  }
}
