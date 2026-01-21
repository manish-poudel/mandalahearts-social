// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_feed_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostFeedItem {

 UserPost get post; String get creatorId; String get creatorName; String? get creatorProfileImageUrl;
/// Create a copy of PostFeedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostFeedItemCopyWith<PostFeedItem> get copyWith => _$PostFeedItemCopyWithImpl<PostFeedItem>(this as PostFeedItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFeedItem&&(identical(other.post, post) || other.post == post)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.creatorProfileImageUrl, creatorProfileImageUrl) || other.creatorProfileImageUrl == creatorProfileImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,post,creatorId,creatorName,creatorProfileImageUrl);

@override
String toString() {
  return 'PostFeedItem(post: $post, creatorId: $creatorId, creatorName: $creatorName, creatorProfileImageUrl: $creatorProfileImageUrl)';
}


}

/// @nodoc
abstract mixin class $PostFeedItemCopyWith<$Res>  {
  factory $PostFeedItemCopyWith(PostFeedItem value, $Res Function(PostFeedItem) _then) = _$PostFeedItemCopyWithImpl;
@useResult
$Res call({
 UserPost post, String creatorId, String creatorName, String? creatorProfileImageUrl
});


$UserPostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostFeedItemCopyWithImpl<$Res>
    implements $PostFeedItemCopyWith<$Res> {
  _$PostFeedItemCopyWithImpl(this._self, this._then);

  final PostFeedItem _self;
  final $Res Function(PostFeedItem) _then;

/// Create a copy of PostFeedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = null,Object? creatorId = null,Object? creatorName = null,Object? creatorProfileImageUrl = freezed,}) {
  return _then(_self.copyWith(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as UserPost,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,creatorProfileImageUrl: freezed == creatorProfileImageUrl ? _self.creatorProfileImageUrl : creatorProfileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PostFeedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPostCopyWith<$Res> get post {
  
  return $UserPostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostFeedItem].
extension PostFeedItemPatterns on PostFeedItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostFeedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostFeedItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostFeedItem value)  $default,){
final _that = this;
switch (_that) {
case _PostFeedItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostFeedItem value)?  $default,){
final _that = this;
switch (_that) {
case _PostFeedItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserPost post,  String creatorId,  String creatorName,  String? creatorProfileImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostFeedItem() when $default != null:
return $default(_that.post,_that.creatorId,_that.creatorName,_that.creatorProfileImageUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserPost post,  String creatorId,  String creatorName,  String? creatorProfileImageUrl)  $default,) {final _that = this;
switch (_that) {
case _PostFeedItem():
return $default(_that.post,_that.creatorId,_that.creatorName,_that.creatorProfileImageUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserPost post,  String creatorId,  String creatorName,  String? creatorProfileImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PostFeedItem() when $default != null:
return $default(_that.post,_that.creatorId,_that.creatorName,_that.creatorProfileImageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _PostFeedItem implements PostFeedItem {
  const _PostFeedItem({required this.post, required this.creatorId, required this.creatorName, this.creatorProfileImageUrl});
  

@override final  UserPost post;
@override final  String creatorId;
@override final  String creatorName;
@override final  String? creatorProfileImageUrl;

/// Create a copy of PostFeedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostFeedItemCopyWith<_PostFeedItem> get copyWith => __$PostFeedItemCopyWithImpl<_PostFeedItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostFeedItem&&(identical(other.post, post) || other.post == post)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.creatorProfileImageUrl, creatorProfileImageUrl) || other.creatorProfileImageUrl == creatorProfileImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,post,creatorId,creatorName,creatorProfileImageUrl);

@override
String toString() {
  return 'PostFeedItem(post: $post, creatorId: $creatorId, creatorName: $creatorName, creatorProfileImageUrl: $creatorProfileImageUrl)';
}


}

/// @nodoc
abstract mixin class _$PostFeedItemCopyWith<$Res> implements $PostFeedItemCopyWith<$Res> {
  factory _$PostFeedItemCopyWith(_PostFeedItem value, $Res Function(_PostFeedItem) _then) = __$PostFeedItemCopyWithImpl;
@override @useResult
$Res call({
 UserPost post, String creatorId, String creatorName, String? creatorProfileImageUrl
});


@override $UserPostCopyWith<$Res> get post;

}
/// @nodoc
class __$PostFeedItemCopyWithImpl<$Res>
    implements _$PostFeedItemCopyWith<$Res> {
  __$PostFeedItemCopyWithImpl(this._self, this._then);

  final _PostFeedItem _self;
  final $Res Function(_PostFeedItem) _then;

/// Create a copy of PostFeedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = null,Object? creatorId = null,Object? creatorName = null,Object? creatorProfileImageUrl = freezed,}) {
  return _then(_PostFeedItem(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as UserPost,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,creatorProfileImageUrl: freezed == creatorProfileImageUrl ? _self.creatorProfileImageUrl : creatorProfileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PostFeedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPostCopyWith<$Res> get post {
  
  return $UserPostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
