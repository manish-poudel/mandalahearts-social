abstract class UserDB {
  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> json,
  });

  Future<void> updateUser({
    required String userId,
    required Map<String, dynamic> json,
  });

  Future<Map<String, dynamic>?> getUser(String userId);

  Stream<Map<String, dynamic>?> streamUser(String userId);
}
