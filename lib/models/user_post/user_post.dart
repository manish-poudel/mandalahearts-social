import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mandalahearts/core/converters/firestore_timestamp_converter.dart';

part 'user_post.freezed.dart';
part 'user_post.g.dart';

@freezed
abstract class UserPost with _$UserPost {
  const factory UserPost({
    required String id,
    required String caption,
    required String imageUrl,

    @FirestoreDateTimeConverter() required DateTime createdAt,

    required String creatorId,

    @FirestoreDateTimeConverter() DateTime? updatedAt,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);
}
