// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostFeedState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFeedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFeedState()';
}


}

/// @nodoc
class $PostFeedStateCopyWith<$Res>  {
$PostFeedStateCopyWith(PostFeedState _, $Res Function(PostFeedState) __);
}


/// Adds pattern-matching-related methods to [PostFeedState].
extension PostFeedStatePatterns on PostFeedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PostFeedInitial value)?  initial,TResult Function( PostFeedLoading value)?  loading,TResult Function( PostFeedInitialError value)?  initialError,TResult Function( PostFeedLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PostFeedInitial() when initial != null:
return initial(_that);case PostFeedLoading() when loading != null:
return loading(_that);case PostFeedInitialError() when initialError != null:
return initialError(_that);case PostFeedLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PostFeedInitial value)  initial,required TResult Function( PostFeedLoading value)  loading,required TResult Function( PostFeedInitialError value)  initialError,required TResult Function( PostFeedLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case PostFeedInitial():
return initial(_that);case PostFeedLoading():
return loading(_that);case PostFeedInitialError():
return initialError(_that);case PostFeedLoaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PostFeedInitial value)?  initial,TResult? Function( PostFeedLoading value)?  loading,TResult? Function( PostFeedInitialError value)?  initialError,TResult? Function( PostFeedLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case PostFeedInitial() when initial != null:
return initial(_that);case PostFeedLoading() when loading != null:
return loading(_that);case PostFeedInitialError() when initialError != null:
return initialError(_that);case PostFeedLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  initialError,TResult Function( List<PostFeedItem> items,  bool hasMore,  bool isLoadingMore,  bool isRefreshing,  String? loadMoreError)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PostFeedInitial() when initial != null:
return initial();case PostFeedLoading() when loading != null:
return loading();case PostFeedInitialError() when initialError != null:
return initialError(_that.message);case PostFeedLoaded() when loaded != null:
return loaded(_that.items,_that.hasMore,_that.isLoadingMore,_that.isRefreshing,_that.loadMoreError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  initialError,required TResult Function( List<PostFeedItem> items,  bool hasMore,  bool isLoadingMore,  bool isRefreshing,  String? loadMoreError)  loaded,}) {final _that = this;
switch (_that) {
case PostFeedInitial():
return initial();case PostFeedLoading():
return loading();case PostFeedInitialError():
return initialError(_that.message);case PostFeedLoaded():
return loaded(_that.items,_that.hasMore,_that.isLoadingMore,_that.isRefreshing,_that.loadMoreError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  initialError,TResult? Function( List<PostFeedItem> items,  bool hasMore,  bool isLoadingMore,  bool isRefreshing,  String? loadMoreError)?  loaded,}) {final _that = this;
switch (_that) {
case PostFeedInitial() when initial != null:
return initial();case PostFeedLoading() when loading != null:
return loading();case PostFeedInitialError() when initialError != null:
return initialError(_that.message);case PostFeedLoaded() when loaded != null:
return loaded(_that.items,_that.hasMore,_that.isLoadingMore,_that.isRefreshing,_that.loadMoreError);case _:
  return null;

}
}

}

/// @nodoc


class PostFeedInitial implements PostFeedState {
  const PostFeedInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFeedInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFeedState.initial()';
}


}




/// @nodoc


class PostFeedLoading implements PostFeedState {
  const PostFeedLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFeedLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostFeedState.loading()';
}


}




/// @nodoc


class PostFeedInitialError implements PostFeedState {
  const PostFeedInitialError({required this.message});
  

 final  String message;

/// Create a copy of PostFeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostFeedInitialErrorCopyWith<PostFeedInitialError> get copyWith => _$PostFeedInitialErrorCopyWithImpl<PostFeedInitialError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFeedInitialError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PostFeedState.initialError(message: $message)';
}


}

/// @nodoc
abstract mixin class $PostFeedInitialErrorCopyWith<$Res> implements $PostFeedStateCopyWith<$Res> {
  factory $PostFeedInitialErrorCopyWith(PostFeedInitialError value, $Res Function(PostFeedInitialError) _then) = _$PostFeedInitialErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PostFeedInitialErrorCopyWithImpl<$Res>
    implements $PostFeedInitialErrorCopyWith<$Res> {
  _$PostFeedInitialErrorCopyWithImpl(this._self, this._then);

  final PostFeedInitialError _self;
  final $Res Function(PostFeedInitialError) _then;

/// Create a copy of PostFeedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PostFeedInitialError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PostFeedLoaded implements PostFeedState {
  const PostFeedLoaded({required final  List<PostFeedItem> items, this.hasMore = true, this.isLoadingMore = false, this.isRefreshing = false, this.loadMoreError}): _items = items;
  

 final  List<PostFeedItem> _items;
 List<PostFeedItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@JsonKey() final  bool hasMore;
@JsonKey() final  bool isLoadingMore;
@JsonKey() final  bool isRefreshing;
 final  String? loadMoreError;

/// Create a copy of PostFeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostFeedLoadedCopyWith<PostFeedLoaded> get copyWith => _$PostFeedLoadedCopyWithImpl<PostFeedLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostFeedLoaded&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.loadMoreError, loadMoreError) || other.loadMoreError == loadMoreError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasMore,isLoadingMore,isRefreshing,loadMoreError);

@override
String toString() {
  return 'PostFeedState.loaded(items: $items, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing, loadMoreError: $loadMoreError)';
}


}

/// @nodoc
abstract mixin class $PostFeedLoadedCopyWith<$Res> implements $PostFeedStateCopyWith<$Res> {
  factory $PostFeedLoadedCopyWith(PostFeedLoaded value, $Res Function(PostFeedLoaded) _then) = _$PostFeedLoadedCopyWithImpl;
@useResult
$Res call({
 List<PostFeedItem> items, bool hasMore, bool isLoadingMore, bool isRefreshing, String? loadMoreError
});




}
/// @nodoc
class _$PostFeedLoadedCopyWithImpl<$Res>
    implements $PostFeedLoadedCopyWith<$Res> {
  _$PostFeedLoadedCopyWithImpl(this._self, this._then);

  final PostFeedLoaded _self;
  final $Res Function(PostFeedLoaded) _then;

/// Create a copy of PostFeedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isRefreshing = null,Object? loadMoreError = freezed,}) {
  return _then(PostFeedLoaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PostFeedItem>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,loadMoreError: freezed == loadMoreError ? _self.loadMoreError : loadMoreError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
