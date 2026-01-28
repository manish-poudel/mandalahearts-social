import 'package:flutter/foundation.dart';
import 'package:mandalahearts/core/services/remote_config/remote_config.dart';
import 'package:mandalahearts/models/app_config/app_config.dart';

class AppConfigRepository {
  final RemoteConfigurations _remoteConfig;

  AppConfig? _cache;

  AppConfigRepository(this._remoteConfig);

  /// Fetch AppConfig JSON (with optional cache)
  Future<AppConfig> getAppConfig({bool forceRefresh = false}) async {
    try {
      if (!forceRefresh && _cache != null) return _cache!;

      final configJson = await _remoteConfig.getConfiguration<dynamic>(
        key: 'app_config',
      );
      _cache = configJson != null
          ? AppConfig.fromJson(configJson as Map<String, dynamic>)
          : _defaultConfig();
      return _cache!;
    } catch (err) {
      debugPrint(err.toString());
      return _defaultConfig();
    }
  }

  /// ForceUpdate
  Future<ForceUpdate?> getForceUpdate({bool forceRefresh = false}) async {
    return (await getAppConfig(forceRefresh: forceRefresh)).forceUpdate;
  }

  Future<String?> getForceUpdateMessage({bool forceRefresh = false}) async {
    return (await getForceUpdate(forceRefresh: forceRefresh))?.messages;
  }

  Future<String?> getForceUpdateLink({bool forceRefresh = false}) async {
    return (await getForceUpdate(forceRefresh: forceRefresh))?.updateLink;
  }

  Future<PasswordReset> getPasswordReset({bool forceRefresh = false}) async {
    final passwordReset = (await getAppConfig(
      forceRefresh: forceRefresh,
    )).passwordReset;
    return passwordReset ??
        PasswordReset(
          handleCodeInApp: true,
          passwordResetUrl: "https://mandalahearts.com/reset-password",
        );
  }

  Future<bool?> shouldForceUpdate(
    String currentVersion, {
    bool forceRefresh = false,
  }) async {
    final versions = (await getForceUpdate(
      forceRefresh: forceRefresh,
    ))?.versions;
    return versions?.contains(currentVersion);
  }

  /// Limits
  Future<int?> getCreateSpiritualMastersLimit({
    bool forceRefresh = false,
  }) async {
    final limits = (await getAppConfig(
      forceRefresh: forceRefresh,
    )).versions?.basics?.limits;
    return limits?.createSpiritualMasters;
  }

  /// Default config if Remote Config fails
  AppConfig _defaultConfig() {
    return AppConfig(
      forceUpdate: ForceUpdate(versions: [], messages: '', updateLink: ''),
      versions: Versions(
        basics: Basics(limits: Limits(createSpiritualMasters: 0)),
      ),
      passwordReset: PasswordReset(
        handleCodeInApp: true,
        passwordResetUrl: "https://mandalahearts.com/reset-password",
      ),
    );
  }
}
