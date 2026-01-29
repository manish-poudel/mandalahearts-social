import 'package:flutter/foundation.dart';
import 'package:mandalahearts/core/services/remote_config/remote_config.dart';
import 'package:mandalahearts/models/app_config/app_config.dart';

class AppConfigRepository {
  final RemoteConfigurations _remoteConfig;
  AppConfig? _cache;

  AppConfigRepository(this._remoteConfig);

  /// Fetch AppConfig with optional cache
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
    } catch (err, stack) {
      debugPrint('Error fetching AppConfig: $err\n$stack');
      return _defaultConfig();
    }
  }

  AppConfig? get cachedConfig => _cache;

  AppConfig _defaultConfig() {
    return AppConfig(
      app: AppInfo(
        forceUpdateVersions: [],
        forceUpdateMessage: '',
        forceUpdateLink: '',
        privacyPolicyLink: 'https://mandalahearts.com/privacy-policy',
        termsAndConditionsLink:
            'https://mandalahearts.com/terms-and-conditions',
      ),
      versions: Versions(basics: PlanLimits(createSpiritualMasters: 5)),
      restrictions: Restrictions(
        post: PostRestrictions(requireVerifiedAccount: false),
      ),
    );
  }
}
