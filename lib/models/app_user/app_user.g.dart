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
  spiritualDetails: json['spiritualDetails'] == null
      ? null
      : SpiritualDetails.fromJson(
          json['spiritualDetails'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'username': instance.username,
  'basicDetails': instance.basicDetails?.toJson(),
  'bio': instance.bio,
  'spiritualDetails': instance.spiritualDetails?.toJson(),
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

_SpiritualDetails _$SpiritualDetailsFromJson(Map<String, dynamic> json) =>
    _SpiritualDetails(
      guruName: json['guruName'] as String?,
      spiritualOrganisation: json['spiritualOrganisation'] as String?,
      spiritualPractice: json['spiritualPractice'] as String?,
    );

Map<String, dynamic> _$SpiritualDetailsToJson(_SpiritualDetails instance) =>
    <String, dynamic>{
      'guruName': instance.guruName,
      'spiritualOrganisation': instance.spiritualOrganisation,
      'spiritualPractice': instance.spiritualPractice,
    };
