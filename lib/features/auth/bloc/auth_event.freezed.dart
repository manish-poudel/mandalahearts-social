// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Started value)?  started,TResult Function( _OnAuthStateChange value)?  onAuthStateChange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Started() when started != null:
return started(_that);case _OnAuthStateChange() when onAuthStateChange != null:
return onAuthStateChange(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Started value)  started,required TResult Function( _OnAuthStateChange value)  onAuthStateChange,}){
final _that = this;
switch (_that) {
case Started():
return started(_that);case _OnAuthStateChange():
return onAuthStateChange(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Started value)?  started,TResult? Function( _OnAuthStateChange value)?  onAuthStateChange,}){
final _that = this;
switch (_that) {
case Started() when started != null:
return started(_that);case _OnAuthStateChange() when onAuthStateChange != null:
return onAuthStateChange(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( User? user)?  onAuthStateChange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case _OnAuthStateChange() when onAuthStateChange != null:
return onAuthStateChange(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( User? user)  onAuthStateChange,}) {final _that = this;
switch (_that) {
case Started():
return started();case _OnAuthStateChange():
return onAuthStateChange(_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( User? user)?  onAuthStateChange,}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case _OnAuthStateChange() when onAuthStateChange != null:
return onAuthStateChange(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class Started implements AuthEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.started()';
}


}




/// @nodoc


class _OnAuthStateChange implements AuthEvent {
  const _OnAuthStateChange({this.user});
  

 final  User? user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnAuthStateChangeCopyWith<_OnAuthStateChange> get copyWith => __$OnAuthStateChangeCopyWithImpl<_OnAuthStateChange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnAuthStateChange&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.onAuthStateChange(user: $user)';
}


}

/// @nodoc
abstract mixin class _$OnAuthStateChangeCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$OnAuthStateChangeCopyWith(_OnAuthStateChange value, $Res Function(_OnAuthStateChange) _then) = __$OnAuthStateChangeCopyWithImpl;
@useResult
$Res call({
 User? user
});




}
/// @nodoc
class __$OnAuthStateChangeCopyWithImpl<$Res>
    implements _$OnAuthStateChangeCopyWith<$Res> {
  __$OnAuthStateChangeCopyWithImpl(this._self, this._then);

  final _OnAuthStateChange _self;
  final $Res Function(_OnAuthStateChange) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_OnAuthStateChange(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}


}

// dart format on
