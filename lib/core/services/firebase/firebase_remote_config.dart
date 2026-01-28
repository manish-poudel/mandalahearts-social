import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mandalahearts/core/services/remote_config/remote_config.dart';

class FirebaseRemoteConfigurations implements RemoteConfigurations {
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfigurations(this._remoteConfig);

  @override
  Future<T?> getConfiguration<T>({required String key}) async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );
    await _remoteConfig.fetchAndActivate();
    final value = _remoteConfig.getValue(key);

    if (T == bool) return value.asBool() as T;
    if (T == int) return value.asInt() as T;
    if (T == double) return value.asDouble() as T;
    if (T == String) return value.asString() as T;

    final rawString = value.asString();
    if (rawString.isEmpty) return null;

    final decoded = jsonDecode(rawString);

    return decoded as T;
  }
}
