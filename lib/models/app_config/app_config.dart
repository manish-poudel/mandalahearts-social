import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@Freezed(toJson: true)
abstract class AppConfig with _$AppConfig {
  const factory AppConfig({
    required AppInfo? app,
    required Versions? versions,
    required Restrictions? restrictions,
  }) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);
}

/// ------------------- App Info -------------------
@freezed
abstract class AppInfo with _$AppInfo {
  const factory AppInfo({
    required List<String>? forceUpdateVersions,
    required String? forceUpdateMessage,
    required String? forceUpdateLink,
    required String? privacyPolicyLink,
    required String? termsAndConditionsLink,
    required String? feedbackLink,
    required String? contactUsLink,
    required String? aboutLink,
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);
}

/// ------------------- Versions -------------------
@freezed
abstract class Versions with _$Versions {
  const factory Versions({required PlanLimits? basics}) = _Versions;

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);
}

@freezed
abstract class PlanLimits with _$PlanLimits {
  const factory PlanLimits({required int? createSpiritualMasters}) =
      _PlanLimits;

  factory PlanLimits.fromJson(Map<String, dynamic> json) =>
      _$PlanLimitsFromJson(json);
}

/// ------------------- Restrictions -------------------
@freezed
abstract class Restrictions with _$Restrictions {
  const factory Restrictions({required PostRestrictions? post}) = _Restrictions;

  factory Restrictions.fromJson(Map<String, dynamic> json) =>
      _$RestrictionsFromJson(json);
}

@freezed
abstract class PostRestrictions with _$PostRestrictions {
  const factory PostRestrictions({required bool? requireVerifiedAccount}) =
      _PostRestrictions;

  factory PostRestrictions.fromJson(Map<String, dynamic> json) =>
      _$PostRestrictionsFromJson(json);
}
