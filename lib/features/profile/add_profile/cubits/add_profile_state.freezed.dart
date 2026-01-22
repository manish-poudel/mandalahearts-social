// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileDetailsState()';
}


}

/// @nodoc
class $ProfileDetailsStateCopyWith<$Res>  {
$ProfileDetailsStateCopyWith(ProfileDetailsState _, $Res Function(ProfileDetailsState) __);
}


/// Adds pattern-matching-related methods to [ProfileDetailsState].
extension ProfileDetailsStatePatterns on ProfileDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Ready value)?  ready,TResult Function( _Saving value)?  saving,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Saving() when saving != null:
return saving(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Ready value)  ready,required TResult Function( _Saving value)  saving,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Ready():
return ready(_that);case _Saving():
return saving(_that);case _Success():
return success(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Ready value)?  ready,TResult? Function( _Saving value)?  saving,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Saving() when saving != null:
return saving(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( AppUser? user)?  ready,TResult Function( AppUser? user)?  saving,TResult Function( AppUser? user)?  success,TResult Function( String message,  AppUser? user)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.user);case _Saving() when saving != null:
return saving(_that.user);case _Success() when success != null:
return success(_that.user);case _Error() when error != null:
return error(_that.message,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( AppUser? user)  ready,required TResult Function( AppUser? user)  saving,required TResult Function( AppUser? user)  success,required TResult Function( String message,  AppUser? user)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Ready():
return ready(_that.user);case _Saving():
return saving(_that.user);case _Success():
return success(_that.user);case _Error():
return error(_that.message,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( AppUser? user)?  ready,TResult? Function( AppUser? user)?  saving,TResult? Function( AppUser? user)?  success,TResult? Function( String message,  AppUser? user)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.user);case _Saving() when saving != null:
return saving(_that.user);case _Success() when success != null:
return success(_that.user);case _Error() when error != null:
return error(_that.message,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements ProfileDetailsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileDetailsState.loading()';
}


}




/// @nodoc


class _Ready implements ProfileDetailsState {
  const _Ready({this.user});
  

 final  AppUser? user;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileDetailsState.ready(user: $user)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $ProfileDetailsStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 AppUser? user
});


$AppUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_Ready(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AppUser?,
  ));
}

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AppUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _Saving implements ProfileDetailsState {
  const _Saving({this.user});
  

 final  AppUser? user;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingCopyWith<_Saving> get copyWith => __$SavingCopyWithImpl<_Saving>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Saving&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileDetailsState.saving(user: $user)';
}


}

/// @nodoc
abstract mixin class _$SavingCopyWith<$Res> implements $ProfileDetailsStateCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) _then) = __$SavingCopyWithImpl;
@useResult
$Res call({
 AppUser? user
});


$AppUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$SavingCopyWithImpl<$Res>
    implements _$SavingCopyWith<$Res> {
  __$SavingCopyWithImpl(this._self, this._then);

  final _Saving _self;
  final $Res Function(_Saving) _then;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_Saving(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AppUser?,
  ));
}

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AppUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _Success implements ProfileDetailsState {
  const _Success({this.user});
  

 final  AppUser? user;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileDetailsState.success(user: $user)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ProfileDetailsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 AppUser? user
});


$AppUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_Success(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AppUser?,
  ));
}

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AppUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _Error implements ProfileDetailsState {
  const _Error({required this.message, this.user});
  

 final  String message;
 final  AppUser? user;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,message,user);

@override
String toString() {
  return 'ProfileDetailsState.error(message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProfileDetailsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, AppUser? user
});


$AppUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = freezed,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AppUser?,
  ));
}

/// Create a copy of ProfileDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AppUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
