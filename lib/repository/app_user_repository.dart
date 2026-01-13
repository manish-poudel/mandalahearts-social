import 'package:mandalahearts/firebase/firestore/user_firestore_service.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

class AppUserRepository {
  AppUserRepository({required UserFirestoreService firestoreService})
    : _firestoreService = firestoreService;

  final UserFirestoreService _firestoreService;

  // Cache variable
  AppUser? _appUser;
  String? name;

  // Getter for easy access
  AppUser? get currentUser => _appUser;

  Future<void> createUser(AppUser user) async {
    try {
      await _firestoreService.createUser(userId: user.uid, json: user.toJson());
      _appUser = user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(AppUser user) async {
    try {
      await _firestoreService.updateUser(userId: user.uid, json: user.toJson());
      _appUser = user;
    } catch (e) {
      rethrow;
    }
  }

  Stream<AppUser?> streamUser(String userId) {
    return _firestoreService.streamUser(userId).map((snapshot) {
      if (!snapshot.exists || snapshot.data() == null) {
        _appUser = null;
        return null;
      }
      // Update cache whenever the stream emits a new value
      final user = AppUser.fromJson(snapshot.data()!);
      _appUser = user;
      return user;
    });
  }

  Future<AppUser?> getUser(String userId, {bool forceRefresh = false}) async {
    try {
      if (_appUser != null && !forceRefresh) {
        return _appUser;
      }
      final snapshot = await _firestoreService.getUser(userId);
      if (!snapshot.exists || snapshot.data() == null) {
        _appUser = null;
        name = "Manish";
        return null;
      }
      _appUser = AppUser.fromJson(snapshot.data()!);

      return _appUser;
    } catch (e) {
      rethrow;
    }
  }

  void clearCache() => _appUser = null;
}
