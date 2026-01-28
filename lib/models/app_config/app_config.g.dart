// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => _AppConfig(
  forceUpdate: json['forceUpdate'] == null
      ? null
      : ForceUpdate.fromJson(json['forceUpdate'] as Map<String, dynamic>),
  versions: json['versions'] == null
      ? null
      : Versions.fromJson(json['versions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppConfigToJson(_AppConfig instance) =>
    <String, dynamic>{
      'forceUpdate': instance.forceUpdate?.toJson(),
      'versions': instance.versions?.toJson(),
    };

_ForceUpdate _$ForceUpdateFromJson(Map<String, dynamic> json) => _ForceUpdate(
  versions: (json['versions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  messages: json['messages'] as String?,
);

Map<String, dynamic> _$ForceUpdateToJson(_ForceUpdate instance) =>
    <String, dynamic>{
      'versions': instance.versions,
      'messages': instance.messages,
    };

_Versions _$VersionsFromJson(Map<String, dynamic> json) => _Versions(
  basics: json['basics'] == null
      ? null
      : Basics.fromJson(json['basics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VersionsToJson(_Versions instance) => <String, dynamic>{
  'basics': instance.basics?.toJson(),
};

_Basics _$BasicsFromJson(Map<String, dynamic> json) => _Basics(
  limits: json['limits'] == null
      ? null
      : Limits.fromJson(json['limits'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BasicsToJson(_Basics instance) => <String, dynamic>{
  'limits': instance.limits?.toJson(),
};

_Limits _$LimitsFromJson(Map<String, dynamic> json) => _Limits(
  createSpiritualMasters: (json['create_spiritual_masters'] as num?)?.toInt(),
);

Map<String, dynamic> _$LimitsToJson(_Limits instance) => <String, dynamic>{
  'create_spiritual_masters': instance.createSpiritualMasters,
};
