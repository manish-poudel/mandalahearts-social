// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  app: json['app'] == null
      ? null
      : AppInfo.fromJson(json['app'] as Map<String, dynamic>),
  versions: json['versions'] == null
      ? null
      : Versions.fromJson(json['versions'] as Map<String, dynamic>),
  restrictions: json['restrictions'] == null
      ? null
      : Restrictions.fromJson(json['restrictions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'app': instance.app?.toJson(),
      'versions': instance.versions?.toJson(),
      'restrictions': instance.restrictions?.toJson(),
    };

_AppInfo _$AppInfoFromJson(Map<String, dynamic> json) => _AppInfo(
  forceUpdateVersions: (json['forceUpdateVersions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  forceUpdateMessage: json['forceUpdateMessage'] as String?,
  forceUpdateLink: json['forceUpdateLink'] as String?,
  privacyPolicyLink: json['privacyPolicyLink'] as String?,
  termsAndConditionsLink: json['termsAndConditionsLink'] as String?,
  feedbackLink: json['feedbackLink'] as String?,
  contactUsLink: json['contactUsLink'] as String?,
  aboutLink: json['aboutLink'] as String?,
);

Map<String, dynamic> _$AppInfoToJson(_AppInfo instance) => <String, dynamic>{
  'forceUpdateVersions': instance.forceUpdateVersions,
  'forceUpdateMessage': instance.forceUpdateMessage,
  'forceUpdateLink': instance.forceUpdateLink,
  'privacyPolicyLink': instance.privacyPolicyLink,
  'termsAndConditionsLink': instance.termsAndConditionsLink,
  'feedbackLink': instance.feedbackLink,
  'contactUsLink': instance.contactUsLink,
  'aboutLink': instance.aboutLink,
};

_Versions _$VersionsFromJson(Map<String, dynamic> json) => _Versions(
  basics: json['basics'] == null
      ? null
      : PlanLimits.fromJson(json['basics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VersionsToJson(_Versions instance) => <String, dynamic>{
  'basics': instance.basics?.toJson(),
};

_PlanLimits _$PlanLimitsFromJson(Map<String, dynamic> json) => _PlanLimits(
  createSpiritualMasters: (json['createSpiritualMasters'] as num?)?.toInt(),
);

Map<String, dynamic> _$PlanLimitsToJson(_PlanLimits instance) =>
    <String, dynamic>{
      'createSpiritualMasters': instance.createSpiritualMasters,
    };

_Restrictions _$RestrictionsFromJson(Map<String, dynamic> json) =>
    _Restrictions(
      post: json['post'] == null
          ? null
          : PostRestrictions.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestrictionsToJson(_Restrictions instance) =>
    <String, dynamic>{'post': instance.post?.toJson()};

_PostRestrictions _$PostRestrictionsFromJson(Map<String, dynamic> json) =>
    _PostRestrictions(
      requireVerifiedAccount: json['requireVerifiedAccount'] as bool?,
    );

Map<String, dynamic> _$PostRestrictionsToJson(_PostRestrictions instance) =>
    <String, dynamic>{
      'requireVerifiedAccount': instance.requireVerifiedAccount,
    };
