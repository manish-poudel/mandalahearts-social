import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mandalahearts/core/services/database/user_db.dart';
import 'package:mandalahearts/core/services/storage/file_storage.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

class AppUserRepository {
  AppUserRepository({required UserDB userDB, required FileStorage storage})
    : _userDB = userDB,
      _storage = storage;

  final UserDB _userDB;
  final FileStorage _storage;

  AppUser? _appUser;

  /// Cached current user
  AppUser? get currentUser => _appUser;

  /// Notifier for UI (dashboard avatar, etc.)
  final ValueNotifier<AppUser?> userNotifier = ValueNotifier(null);

  static const String _postImageBucket = 'profile-images';
  static const int _signedUrlExpiry = 157680000 * 20;

  /* -------------------- INTERNAL -------------------- */

  void _setUser(AppUser? user) {
    _appUser = user;
    userNotifier.value = user;
  }

  /* -------------------- CRUD -------------------- */

  Future<void> createUser(AppUser user) async {
    await _userDB.createUser(userId: user.uid, json: user.toJson());
    _setUser(user);
  }

  Future<void> updateUser(AppUser user) async {
    await _userDB.updateUser(userId: user.uid, json: user.toJson());
    _setUser(user);
  }

  Future<AppUser?> getUser(String userId, {bool forceRefresh = false}) async {
    if (_appUser != null && !forceRefresh) {
      return _appUser;
    }

    final data = await _userDB.getUser(userId);

    if (data == null) {
      _setUser(null);
      return null;
    }

    final user = AppUser.fromJson(data);
    _setUser(user);
    return user;
  }

  Future<AppUser?> getPublicUser(String userId) async {
    final data = await _userDB.getUser(userId);
    if (data != null) {
      final user = AppUser.fromJson(data);
      return user;
    }
    return null;
  }
  /* -------------------- STREAM (OPTIONAL) -------------------- */

  Stream<AppUser?> streamUser(String userId) {
    return _userDB.streamUser(userId).map((data) {
      if (data == null) {
        _setUser(null);
        return null;
      }

      final user = AppUser.fromJson(data);
      _setUser(user);
      return user;
    });
  }

  /* -------------------- PROFILE IMAGE -------------------- */

  Future<void> saveProfileImage({
    required Uint8List imageBytes,
    String extension = 'png',
    String contentType = 'image/png',
  }) async {
    final user = currentUser!;
    final filePath = '${user.uid}.$extension';

    await _storage.uploadImage(
      bucket: _postImageBucket,
      filePath: filePath,
      bytes: imageBytes,
      contentType: contentType,
    );

    final url = await _storage.createSignedUrl(
      bucket: _postImageBucket,
      filePath: filePath,
      expiresInSeconds: _signedUrlExpiry,
    );

    await updateUser(
      user.copyWith(
        basicDetails: user.basicDetails!.copyWith(profilePictureUrl: url),
      ),
    );
  }

  Future<void> removeProfileImage() async {
    final user = currentUser!;
    final basicDetails = user.basicDetails;
    if (basicDetails == null || basicDetails.profilePictureUrl == null) return;
    final filePath = '${user.uid}.png';
    updateUser(
      user.copyWith(
        basicDetails: basicDetails.copyWith(profilePictureUrl: null),
      ),
    );
    _storage.deleteFile(bucket: _postImageBucket, filePath: filePath);
  }

  /* -------------------- CLEAR -------------------- */

  void clearCache() {
    _setUser(null);
  }
}
