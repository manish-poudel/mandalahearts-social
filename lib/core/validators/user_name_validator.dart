class UsernameValidator {
  /// Returns `null` if valid, otherwise returns the error message
  static String? validate(String? value) {
    if (value == null || value.isEmpty) return 'Username cannot be empty';
    if (value.length < 3 || value.length > 30) {
      return 'Username must be 3–30 characters long';
    }

    final regex = RegExp(r'^[a-zA-Z0-9._]+$');
    if (!regex.hasMatch(value)) {
      return 'Only letters, numbers, underscores, and periods allowed';
    }

    if (value.startsWith('.') || value.endsWith('.')) {
      return 'Cannot start or end with a period';
    }
    if (value.contains('..')) return 'Cannot contain consecutive periods';
    if (value.contains(' ')) return 'Cannot contain spaces';

    return null;
  }

  /// Returns true/false if username is valid
  static bool isValid(String value) => validate(value) == null;
}
