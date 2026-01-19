// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPost _$UserPostFromJson(Map<String, dynamic> json) => _UserPost(
  id: json['id'] as String,
  caption: json['caption'] as String,
  imageUrl: json['imageUrl'] as String,
  createdAt: const FirestoreDateTimeConverter().fromJson(
    json['createdAt'] as Object,
  ),
  creatorId: json['creatorId'] as String,
  updatedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['updatedAt'],
    const FirestoreDateTimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$UserPostToJson(_UserPost instance) => <String, dynamic>{
  'id': instance.id,
  'caption': instance.caption,
  'imageUrl': instance.imageUrl,
  'createdAt': const FirestoreDateTimeConverter().toJson(instance.createdAt),
  'creatorId': instance.creatorId,
  'updatedAt': _$JsonConverterToJson<Object, DateTime>(
    instance.updatedAt,
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
