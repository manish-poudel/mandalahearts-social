import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_creator_cache.freezed.dart';

@freezed
abstract class PostCreatorCache with _$PostCreatorCache {
  const factory PostCreatorCache({
    required String id,
    required String name,
    String? profileImageUrl,
  }) = _PostCreatorCache;
}
