class UsernameAlreadyExistsException implements Exception {
  final String message;
  UsernameAlreadyExistsException([this.message = 'Username already exists']);

  @override
  String toString() => message;
}

class NoUsernameException implements Exception {
  final String message;
  NoUsernameException([this.message = 'No username found']);

  @override
  String toString() => message;
}

class NoBasicUserDetailsException implements Exception {
  final String message;
  NoBasicUserDetailsException([this.message = 'No basic user details found']);
  @override
  String toString() => message;
}
