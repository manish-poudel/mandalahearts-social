// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  uid: json['uid'] as String,
  username: json['username'] as String,
  basicDetails: json['basicDetails'] == null
      ? null
      : BasicDetails.fromJson(json['basicDetails'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  spiritualMasters: (json['spiritualMasters'] as List<dynamic>?)
      ?.map((e) => SpiritualMasters.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'username': instance.username,
  'basicDetails': instance.basicDetails?.toJson(),
  'bio': instance.bio,
  'spiritualMasters': instance.spiritualMasters
      ?.map((e) => e.toJson())
      .toList(),
};

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

_SpiritualMasters _$SpiritualMastersFromJson(Map<String, dynamic> json) =>
    _SpiritualMasters(
      guruName: json['guruName'] as String,
      spiritualOrganisation: json['spiritualOrganisation'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SpiritualMastersToJson(_SpiritualMasters instance) =>
    <String, dynamic>{
      'guruName': instance.guruName,
      'spiritualOrganisation': instance.spiritualOrganisation,
      'description': instance.description,
    };
