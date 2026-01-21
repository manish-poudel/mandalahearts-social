import 'package:mandalahearts/core/services/database/user_db.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

class AppUserRepository {
  AppUserRepository({required UserDB userDB}) : _userDB = userDB;

  final UserDB _userDB;

  AppUser? _appUser;

  AppUser? get currentUser => _appUser;

  Future<void> createUser(AppUser user) async {
    await _userDB.createUser(userId: user.uid, json: user.toJson());
    _appUser = user;
  }

  Future<void> updateUser(AppUser user) async {
    await _userDB.updateUser(userId: user.uid, json: user.toJson());
    _appUser = user;
  }

  Stream<AppUser?> streamUser(String userId) {
    return _userDB.streamUser(userId).map((data) {
      if (data == null) {
        _appUser = null;
        return null;
      }

      final user = AppUser.fromJson(data);
      _appUser = user;
      return user;
    });
  }

  Future<AppUser?> getUser(String userId, {bool forceRefresh = false}) async {
    if (_appUser != null && !forceRefresh) {
      return _appUser;
    }

    final data = await _userDB.getUser(userId);

    if (data == null) {
      _appUser = null;
      return null;
    }

    final user = AppUser.fromJson(data);
    _appUser = user;
    return user;
  }

  void clearCache() => _appUser = null;
}
