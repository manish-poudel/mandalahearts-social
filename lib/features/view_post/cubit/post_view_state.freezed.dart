// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostViewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostViewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostViewState()';
}


}

/// @nodoc
class $PostViewStateCopyWith<$Res>  {
$PostViewStateCopyWith(PostViewState _, $Res Function(PostViewState) __);
}


/// Adds pattern-matching-related methods to [PostViewState].
extension PostViewStatePatterns on PostViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Deleted value)?  deleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Deleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Deleted value)  deleted,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Deleted():
return deleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Deleted value)?  deleted,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Deleted() when deleted != null:
return deleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( PostFeedItem postFeedItem,  bool canDelete,  AsyncState deleteState)?  loaded,TResult Function()?  deleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.postFeedItem,_that.canDelete,_that.deleteState);case _Deleted() when deleted != null:
return deleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( PostFeedItem postFeedItem,  bool canDelete,  AsyncState deleteState)  loaded,required TResult Function()  deleted,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Loaded():
return loaded(_that.postFeedItem,_that.canDelete,_that.deleteState);case _Deleted():
return deleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( PostFeedItem postFeedItem,  bool canDelete,  AsyncState deleteState)?  loaded,TResult? Function()?  deleted,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.postFeedItem,_that.canDelete,_that.deleteState);case _Deleted() when deleted != null:
return deleted();case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements PostViewState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostViewState.loading()';
}


}




/// @nodoc


class _Loaded implements PostViewState {
  const _Loaded(this.postFeedItem, this.canDelete, {this.deleteState = const AsyncState.initial()});
  

 final  PostFeedItem postFeedItem;
 final  bool canDelete;
@JsonKey() final  AsyncState deleteState;

/// Create a copy of PostViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.postFeedItem, postFeedItem) || other.postFeedItem == postFeedItem)&&(identical(other.canDelete, canDelete) || other.canDelete == canDelete)&&(identical(other.deleteState, deleteState) || other.deleteState == deleteState));
}


@override
int get hashCode => Object.hash(runtimeType,postFeedItem,canDelete,deleteState);

@override
String toString() {
  return 'PostViewState.loaded(postFeedItem: $postFeedItem, canDelete: $canDelete, deleteState: $deleteState)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $PostViewStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 PostFeedItem postFeedItem, bool canDelete, AsyncState deleteState
});


$PostFeedItemCopyWith<$Res> get postFeedItem;$AsyncStateCopyWith<$Res> get deleteState;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of PostViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postFeedItem = null,Object? canDelete = null,Object? deleteState = null,}) {
  return _then(_Loaded(
null == postFeedItem ? _self.postFeedItem : postFeedItem // ignore: cast_nullable_to_non_nullable
as PostFeedItem,null == canDelete ? _self.canDelete : canDelete // ignore: cast_nullable_to_non_nullable
as bool,deleteState: null == deleteState ? _self.deleteState : deleteState // ignore: cast_nullable_to_non_nullable
as AsyncState,
  ));
}

/// Create a copy of PostViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostFeedItemCopyWith<$Res> get postFeedItem {
  
  return $PostFeedItemCopyWith<$Res>(_self.postFeedItem, (value) {
    return _then(_self.copyWith(postFeedItem: value));
  });
}/// Create a copy of PostViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<$Res> get deleteState {
  
  return $AsyncStateCopyWith<$Res>(_self.deleteState, (value) {
    return _then(_self.copyWith(deleteState: value));
  });
}
}

/// @nodoc


class _Deleted implements PostViewState {
  const _Deleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostViewState.deleted()';
}


}




// dart format on
