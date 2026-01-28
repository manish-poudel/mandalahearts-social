import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@Freezed(toJson: true)
abstract class AppConfig with _$AppConfig {
  const factory AppConfig({
    required ForceUpdate? forceUpdate,
    required Versions? versions,
    required PasswordReset? passwordReset,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}

@freezed
abstract class ForceUpdate with _$ForceUpdate {
  const factory ForceUpdate({
    required List<String>? versions,
    required String? messages,
    required String? updateLink,
  }) = _ForceUpdate;

  factory ForceUpdate.fromJson(Map<String, dynamic> json) =>
      _$ForceUpdateFromJson(json);
}

@freezed
abstract class Versions with _$Versions {
  const factory Versions({required Basics? basics}) = _Versions;

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);
}

@freezed
abstract class Basics with _$Basics {
  const factory Basics({required Limits? limits}) = _Basics;

  factory Basics.fromJson(Map<String, dynamic> json) => _$BasicsFromJson(json);
}

@freezed
abstract class Limits with _$Limits {
  const factory Limits({
    @JsonKey(name: 'create_spiritual_masters')
    required int? createSpiritualMasters,
  }) = _Limits;

  factory Limits.fromJson(Map<String, dynamic> json) => _$LimitsFromJson(json);
}

@freezed
abstract class PasswordReset with _$PasswordReset {
  const factory PasswordReset({
    required bool handleCodeInApp,
    required String passwordResetUrl,
  }) = _PasswordReset;

  factory PasswordReset.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetFromJson(json);
}
