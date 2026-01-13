// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  uid: json['uid'] as String,
  username: json['username'] as String,
  firstName: json['firstName'] as String,
  secondName: json['secondName'] as String,
  dob: DateTime.parse(json['dob'] as String),
  gender: json['gender'] as String,
  bio: json['bio'] as String?,
  guruName: json['guruName'] as String?,
  spiritualOrganisation: json['spiritualOrganisation'] as String?,
  spiritualPractice: json['spiritualPractice'] as String?,
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'username': instance.username,
  'firstName': instance.firstName,
  'secondName': instance.secondName,
  'dob': instance.dob.toIso8601String(),
  'gender': instance.gender,
  'bio': instance.bio,
  'guruName': instance.guruName,
  'spiritualOrganisation': instance.spiritualOrganisation,
  'spiritualPractice': instance.spiritualPractice,
};
