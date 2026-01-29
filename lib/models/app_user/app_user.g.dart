// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  uid: json['uid'] as String,
  username: json['username'] as String,
  status: json['status'] as String?,
  basicDetails: json['basicDetails'] == null
      ? null
      : BasicDetails.fromJson(json['basicDetails'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  spiritualMasters: (json['spiritualMasters'] as List<dynamic>?)
      ?.map((e) => SpiritualMaster.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: _$JsonConverterFromJson<Object, DateTime>(
    json['createdAt'],
    const FirestoreDateTimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'username': instance.username,
  'status': instance.status,
  'basicDetails': instance.basicDetails?.toJson(),
  'bio': instance.bio,
  'spiritualMasters': instance.spiritualMasters
      ?.map((e) => e.toJson())
      .toList(),
  'createdAt': _$JsonConverterToJson<Object, DateTime>(
    instance.createdAt,
    const FirestoreDateTimeConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_BasicDetails _$BasicDetailsFromJson(Map<String, dynamic> json) =>
    _BasicDetails(
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String,
      dob: const FirestoreDateTimeConverter().fromJson(json['dob'] as Object),
      country: json['country'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );

Map<String, dynamic> _$BasicDetailsToJson(_BasicDetails instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'dob': const FirestoreDateTimeConverter().toJson(instance.dob),
      'country': instance.country,
      'profilePictureUrl': instance.profilePictureUrl,
    };

_SpiritualMaster _$SpiritualMasterFromJson(Map<String, dynamic> json) =>
    _SpiritualMaster(
      id: json['id'] as String?,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$SpiritualMasterToJson(_SpiritualMaster instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };
