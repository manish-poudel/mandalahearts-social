// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPost {

 String get id; String get caption; String get imageUrl; DateTime get createdAt; String get creatorId; DateTime? get updatedAt;
/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPostCopyWith<UserPost> get copyWith => _$UserPostCopyWithImpl<UserPost>(this as UserPost, _$identity);

  /// Serializes this UserPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPost&&(identical(other.id, id) || other.id == id)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,caption,imageUrl,createdAt,creatorId,updatedAt);

@override
String toString() {
  return 'UserPost(id: $id, caption: $caption, imageUrl: $imageUrl, createdAt: $createdAt, creatorId: $creatorId, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserPostCopyWith<$Res>  {
  factory $UserPostCopyWith(UserPost value, $Res Function(UserPost) _then) = _$UserPostCopyWithImpl;
@useResult
$Res call({
 String id, String caption, String imageUrl, DateTime createdAt, String creatorId, DateTime? updatedAt
});




}
/// @nodoc
class _$UserPostCopyWithImpl<$Res>
    implements $UserPostCopyWith<$Res> {
  _$UserPostCopyWithImpl(this._self, this._then);

  final UserPost _self;
  final $Res Function(UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? caption = null,Object? imageUrl = null,Object? createdAt = null,Object? creatorId = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPost].
extension UserPostPatterns on UserPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPost value)  $default,){
final _that = this;
switch (_that) {
case _UserPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPost value)?  $default,){
final _that = this;
switch (_that) {
case _UserPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String caption,  String imageUrl,  DateTime createdAt,  String creatorId,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPost() when $default != null:
return $default(_that.id,_that.caption,_that.imageUrl,_that.createdAt,_that.creatorId,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String caption,  String imageUrl,  DateTime createdAt,  String creatorId,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserPost():
return $default(_that.id,_that.caption,_that.imageUrl,_that.createdAt,_that.creatorId,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String caption,  String imageUrl,  DateTime createdAt,  String creatorId,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserPost() when $default != null:
return $default(_that.id,_that.caption,_that.imageUrl,_that.createdAt,_that.creatorId,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPost implements UserPost {
  const _UserPost({required this.id, required this.caption, required this.imageUrl, required this.createdAt, required this.creatorId, this.updatedAt});
  factory _UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);

@override final  String id;
@override final  String caption;
@override final  String imageUrl;
@override final  DateTime createdAt;
@override final  String creatorId;
@override final  DateTime? updatedAt;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPostCopyWith<_UserPost> get copyWith => __$UserPostCopyWithImpl<_UserPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPost&&(identical(other.id, id) || other.id == id)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,caption,imageUrl,createdAt,creatorId,updatedAt);

@override
String toString() {
  return 'UserPost(id: $id, caption: $caption, imageUrl: $imageUrl, createdAt: $createdAt, creatorId: $creatorId, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserPostCopyWith<$Res> implements $UserPostCopyWith<$Res> {
  factory _$UserPostCopyWith(_UserPost value, $Res Function(_UserPost) _then) = __$UserPostCopyWithImpl;
@override @useResult
$Res call({
 String id, String caption, String imageUrl, DateTime createdAt, String creatorId, DateTime? updatedAt
});




}
/// @nodoc
class __$UserPostCopyWithImpl<$Res>
    implements _$UserPostCopyWith<$Res> {
  __$UserPostCopyWithImpl(this._self, this._then);

  final _UserPost _self;
  final $Res Function(_UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? caption = null,Object? imageUrl = null,Object? createdAt = null,Object? creatorId = null,Object? updatedAt = freezed,}) {
  return _then(_UserPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
