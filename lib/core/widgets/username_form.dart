import 'package:flutter/material.dart';
import 'package:mandalahearts/core/validators/user_name_validator.dart';

class UsernameForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final String? errorMessage;
  final bool isLoading;
  final VoidCallback onSubmit;
  final String buttonText;

  const UsernameForm({
    super.key,
    required this.formKey,
    required this.controller,
    required this.onSubmit,
    required this.buttonText,
    this.errorMessage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter username',
              errorText: errorMessage,
            ),
            autocorrect: false,
            enableSuggestions: false,
            validator: UsernameValidator.validate,
          ),

          const SizedBox(height: 32),

          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
              ),
              onPressed: isLoading ? null : onSubmit,
              child: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
