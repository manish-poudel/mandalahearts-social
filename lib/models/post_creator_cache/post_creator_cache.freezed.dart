// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_creator_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostCreatorCache {

 String get id; String get name; String? get profileImageUrl;
/// Create a copy of PostCreatorCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCreatorCacheCopyWith<PostCreatorCache> get copyWith => _$PostCreatorCacheCopyWithImpl<PostCreatorCache>(this as PostCreatorCache, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCreatorCache&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,profileImageUrl);

@override
String toString() {
  return 'PostCreatorCache(id: $id, name: $name, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class $PostCreatorCacheCopyWith<$Res>  {
  factory $PostCreatorCacheCopyWith(PostCreatorCache value, $Res Function(PostCreatorCache) _then) = _$PostCreatorCacheCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? profileImageUrl
});




}
/// @nodoc
class _$PostCreatorCacheCopyWithImpl<$Res>
    implements $PostCreatorCacheCopyWith<$Res> {
  _$PostCreatorCacheCopyWithImpl(this._self, this._then);

  final PostCreatorCache _self;
  final $Res Function(PostCreatorCache) _then;

/// Create a copy of PostCreatorCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? profileImageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostCreatorCache].
extension PostCreatorCachePatterns on PostCreatorCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostCreatorCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostCreatorCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostCreatorCache value)  $default,){
final _that = this;
switch (_that) {
case _PostCreatorCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostCreatorCache value)?  $default,){
final _that = this;
switch (_that) {
case _PostCreatorCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? profileImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostCreatorCache() when $default != null:
return $default(_that.id,_that.name,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? profileImageUrl)  $default,) {final _that = this;
switch (_that) {
case _PostCreatorCache():
return $default(_that.id,_that.name,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? profileImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PostCreatorCache() when $default != null:
return $default(_that.id,_that.name,_that.profileImageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _PostCreatorCache implements PostCreatorCache {
  const _PostCreatorCache({required this.id, required this.name, this.profileImageUrl});
  

@override final  String id;
@override final  String name;
@override final  String? profileImageUrl;

/// Create a copy of PostCreatorCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCreatorCacheCopyWith<_PostCreatorCache> get copyWith => __$PostCreatorCacheCopyWithImpl<_PostCreatorCache>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCreatorCache&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,profileImageUrl);

@override
String toString() {
  return 'PostCreatorCache(id: $id, name: $name, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class _$PostCreatorCacheCopyWith<$Res> implements $PostCreatorCacheCopyWith<$Res> {
  factory _$PostCreatorCacheCopyWith(_PostCreatorCache value, $Res Function(_PostCreatorCache) _then) = __$PostCreatorCacheCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? profileImageUrl
});




}
/// @nodoc
class __$PostCreatorCacheCopyWithImpl<$Res>
    implements _$PostCreatorCacheCopyWith<$Res> {
  __$PostCreatorCacheCopyWithImpl(this._self, this._then);

  final _PostCreatorCache _self;
  final $Res Function(_PostCreatorCache) _then;

/// Create a copy of PostCreatorCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? profileImageUrl = freezed,}) {
  return _then(_PostCreatorCache(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
