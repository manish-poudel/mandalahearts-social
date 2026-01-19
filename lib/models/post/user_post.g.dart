// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPost _$UserPostFromJson(Map<String, dynamic> json) => _UserPost(
  id: json['id'] as String,
  caption: json['caption'] as String,
  imageUrl: json['imageUrl'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  creatorId: json['creatorId'] as String,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserPostToJson(_UserPost instance) => <String, dynamic>{
  'id': instance.id,
  'caption': instance.caption,
  'imageUrl': instance.imageUrl,
  'createdAt': instance.createdAt.toIso8601String(),
  'creatorId': instance.creatorId,
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
