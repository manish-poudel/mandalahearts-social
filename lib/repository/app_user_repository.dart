import 'package:mandalahearts/core/services/firestore/firestore_user_service.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

class AppUserRepository {
  AppUserRepository({required FirestoreUserService firestoreService})
    : _firestoreService = firestoreService;

  final FirestoreUserService _firestoreService;

  // Cache variable
  AppUser? _appUser;

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
      final user = AppUser.fromJson(snapshot.data()!);
      _appUser = user;
      return user;
    });
  }

  Future<AppUser?> getUser(String userId, {bool forceRefresh = false}) async {
    try {
      // Return cached user if available
      if (_appUser != null && !forceRefresh) {
        return _appUser;
      }

      // Fetch from Firestore
      final snapshot = await _firestoreService.getUser(userId);

      if (!snapshot.exists || snapshot.data() == null) {
        _appUser = null;
        return null;
      }
      final data = snapshot.data()!;
      _appUser = AppUser.fromJson(data);
      return _appUser;
    } catch (e) {
      rethrow; // Let the Cubit/UI handle the exception
    }
  }

  void clearCache() => _appUser = null;
}
