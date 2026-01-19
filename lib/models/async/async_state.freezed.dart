// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncState()';
}


}

/// @nodoc
class $AsyncStateCopyWith<$Res>  {
$AsyncStateCopyWith(AsyncState _, $Res Function(AsyncState) __);
}


/// Adds pattern-matching-related methods to [AsyncState].
extension AsyncStatePatterns on AsyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AsyncInitial value)?  initial,TResult Function( AsyncLoading value)?  loading,TResult Function( AsyncSuccess value)?  success,TResult Function( AsyncError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial(_that);case AsyncLoading() when loading != null:
return loading(_that);case AsyncSuccess() when success != null:
return success(_that);case AsyncError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AsyncInitial value)  initial,required TResult Function( AsyncLoading value)  loading,required TResult Function( AsyncSuccess value)  success,required TResult Function( AsyncError value)  error,}){
final _that = this;
switch (_that) {
case AsyncInitial():
return initial(_that);case AsyncLoading():
return loading(_that);case AsyncSuccess():
return success(_that);case AsyncError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AsyncInitial value)?  initial,TResult? Function( AsyncLoading value)?  loading,TResult? Function( AsyncSuccess value)?  success,TResult? Function( AsyncError value)?  error,}){
final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial(_that);case AsyncLoading() when loading != null:
return loading(_that);case AsyncSuccess() when success != null:
return success(_that);case AsyncError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial();case AsyncLoading() when loading != null:
return loading();case AsyncSuccess() when success != null:
return success();case AsyncError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AsyncInitial():
return initial();case AsyncLoading():
return loading();case AsyncSuccess():
return success();case AsyncError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AsyncInitial() when initial != null:
return initial();case AsyncLoading() when loading != null:
return loading();case AsyncSuccess() when success != null:
return success();case AsyncError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AsyncInitial implements AsyncState {
  const AsyncInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncState.initial()';
}


}




/// @nodoc


class AsyncLoading implements AsyncState {
  const AsyncLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncState.loading()';
}


}




/// @nodoc


class AsyncSuccess implements AsyncState {
  const AsyncSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncState.success()';
}


}




/// @nodoc


class AsyncError implements AsyncState {
  const AsyncError(this.message);
  

 final  String message;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncErrorCopyWith<AsyncError> get copyWith => _$AsyncErrorCopyWithImpl<AsyncError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AsyncState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AsyncErrorCopyWith<$Res> implements $AsyncStateCopyWith<$Res> {
  factory $AsyncErrorCopyWith(AsyncError value, $Res Function(AsyncError) _then) = _$AsyncErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AsyncErrorCopyWithImpl<$Res>
    implements $AsyncErrorCopyWith<$Res> {
  _$AsyncErrorCopyWithImpl(this._self, this._then);

  final AsyncError _self;
  final $Res Function(AsyncError) _then;

/// Create a copy of AsyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AsyncError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
