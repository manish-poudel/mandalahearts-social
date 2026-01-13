abstract class UsernameDB {
  Future<void> createUsername({
    required String username,
    required String userId,
  });
  Future<bool> usernameExists(String username);
}
