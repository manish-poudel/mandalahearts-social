// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteAccountState {

 bool get isGoogleUser;
/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAccountStateCopyWith<DeleteAccountState> get copyWith => _$DeleteAccountStateCopyWithImpl<DeleteAccountState>(this as DeleteAccountState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAccountState&&(identical(other.isGoogleUser, isGoogleUser) || other.isGoogleUser == isGoogleUser));
}


@override
int get hashCode => Object.hash(runtimeType,isGoogleUser);

@override
String toString() {
  return 'DeleteAccountState(isGoogleUser: $isGoogleUser)';
}


}

/// @nodoc
abstract mixin class $DeleteAccountStateCopyWith<$Res>  {
  factory $DeleteAccountStateCopyWith(DeleteAccountState value, $Res Function(DeleteAccountState) _then) = _$DeleteAccountStateCopyWithImpl;
@useResult
$Res call({
 bool isGoogleUser
});




}
/// @nodoc
class _$DeleteAccountStateCopyWithImpl<$Res>
    implements $DeleteAccountStateCopyWith<$Res> {
  _$DeleteAccountStateCopyWithImpl(this._self, this._then);

  final DeleteAccountState _self;
  final $Res Function(DeleteAccountState) _then;

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isGoogleUser = null,}) {
  return _then(_self.copyWith(
isGoogleUser: null == isGoogleUser ? _self.isGoogleUser : isGoogleUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteAccountState].
extension DeleteAccountStatePatterns on DeleteAccountState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Reauth value)?  reauth,TResult Function( _ConfirmDelete value)?  confirmDelete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Reauth() when reauth != null:
return reauth(_that);case _ConfirmDelete() when confirmDelete != null:
return confirmDelete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Reauth value)  reauth,required TResult Function( _ConfirmDelete value)  confirmDelete,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Reauth():
return reauth(_that);case _ConfirmDelete():
return confirmDelete(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Reauth value)?  reauth,TResult? Function( _ConfirmDelete value)?  confirmDelete,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Reauth() when reauth != null:
return reauth(_that);case _ConfirmDelete() when confirmDelete != null:
return confirmDelete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isGoogleUser)?  init,TResult Function( bool isGoogleUser,  AsyncState loginState)?  reauth,TResult Function( bool isGoogleUser,  AsyncState deleteState)?  confirmDelete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.isGoogleUser);case _Reauth() when reauth != null:
return reauth(_that.isGoogleUser,_that.loginState);case _ConfirmDelete() when confirmDelete != null:
return confirmDelete(_that.isGoogleUser,_that.deleteState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isGoogleUser)  init,required TResult Function( bool isGoogleUser,  AsyncState loginState)  reauth,required TResult Function( bool isGoogleUser,  AsyncState deleteState)  confirmDelete,}) {final _that = this;
switch (_that) {
case _Init():
return init(_that.isGoogleUser);case _Reauth():
return reauth(_that.isGoogleUser,_that.loginState);case _ConfirmDelete():
return confirmDelete(_that.isGoogleUser,_that.deleteState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isGoogleUser)?  init,TResult? Function( bool isGoogleUser,  AsyncState loginState)?  reauth,TResult? Function( bool isGoogleUser,  AsyncState deleteState)?  confirmDelete,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that.isGoogleUser);case _Reauth() when reauth != null:
return reauth(_that.isGoogleUser,_that.loginState);case _ConfirmDelete() when confirmDelete != null:
return confirmDelete(_that.isGoogleUser,_that.deleteState);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements DeleteAccountState {
  const _Init({required this.isGoogleUser});
  

@override final  bool isGoogleUser;

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitCopyWith<_Init> get copyWith => __$InitCopyWithImpl<_Init>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init&&(identical(other.isGoogleUser, isGoogleUser) || other.isGoogleUser == isGoogleUser));
}


@override
int get hashCode => Object.hash(runtimeType,isGoogleUser);

@override
String toString() {
  return 'DeleteAccountState.init(isGoogleUser: $isGoogleUser)';
}


}

/// @nodoc
abstract mixin class _$InitCopyWith<$Res> implements $DeleteAccountStateCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) _then) = __$InitCopyWithImpl;
@override @useResult
$Res call({
 bool isGoogleUser
});




}
/// @nodoc
class __$InitCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(this._self, this._then);

  final _Init _self;
  final $Res Function(_Init) _then;

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isGoogleUser = null,}) {
  return _then(_Init(
isGoogleUser: null == isGoogleUser ? _self.isGoogleUser : isGoogleUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Reauth implements DeleteAccountState {
  const _Reauth({required this.isGoogleUser, this.loginState = const AsyncState.initial()});
  

@override final  bool isGoogleUser;
@JsonKey() final  AsyncState loginState;

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReauthCopyWith<_Reauth> get copyWith => __$ReauthCopyWithImpl<_Reauth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reauth&&(identical(other.isGoogleUser, isGoogleUser) || other.isGoogleUser == isGoogleUser)&&(identical(other.loginState, loginState) || other.loginState == loginState));
}


@override
int get hashCode => Object.hash(runtimeType,isGoogleUser,loginState);

@override
String toString() {
  return 'DeleteAccountState.reauth(isGoogleUser: $isGoogleUser, loginState: $loginState)';
}


}

/// @nodoc
abstract mixin class _$ReauthCopyWith<$Res> implements $DeleteAccountStateCopyWith<$Res> {
  factory _$ReauthCopyWith(_Reauth value, $Res Function(_Reauth) _then) = __$ReauthCopyWithImpl;
@override @useResult
$Res call({
 bool isGoogleUser, AsyncState loginState
});


$AsyncStateCopyWith<$Res> get loginState;

}
/// @nodoc
class __$ReauthCopyWithImpl<$Res>
    implements _$ReauthCopyWith<$Res> {
  __$ReauthCopyWithImpl(this._self, this._then);

  final _Reauth _self;
  final $Res Function(_Reauth) _then;

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isGoogleUser = null,Object? loginState = null,}) {
  return _then(_Reauth(
isGoogleUser: null == isGoogleUser ? _self.isGoogleUser : isGoogleUser // ignore: cast_nullable_to_non_nullable
as bool,loginState: null == loginState ? _self.loginState : loginState // ignore: cast_nullable_to_non_nullable
as AsyncState,
  ));
}

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<$Res> get loginState {
  
  return $AsyncStateCopyWith<$Res>(_self.loginState, (value) {
    return _then(_self.copyWith(loginState: value));
  });
}
}

/// @nodoc


class _ConfirmDelete implements DeleteAccountState {
  const _ConfirmDelete({required this.isGoogleUser, this.deleteState = const AsyncState.initial()});
  

@override final  bool isGoogleUser;
@JsonKey() final  AsyncState deleteState;

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmDeleteCopyWith<_ConfirmDelete> get copyWith => __$ConfirmDeleteCopyWithImpl<_ConfirmDelete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmDelete&&(identical(other.isGoogleUser, isGoogleUser) || other.isGoogleUser == isGoogleUser)&&(identical(other.deleteState, deleteState) || other.deleteState == deleteState));
}


@override
int get hashCode => Object.hash(runtimeType,isGoogleUser,deleteState);

@override
String toString() {
  return 'DeleteAccountState.confirmDelete(isGoogleUser: $isGoogleUser, deleteState: $deleteState)';
}


}

/// @nodoc
abstract mixin class _$ConfirmDeleteCopyWith<$Res> implements $DeleteAccountStateCopyWith<$Res> {
  factory _$ConfirmDeleteCopyWith(_ConfirmDelete value, $Res Function(_ConfirmDelete) _then) = __$ConfirmDeleteCopyWithImpl;
@override @useResult
$Res call({
 bool isGoogleUser, AsyncState deleteState
});


$AsyncStateCopyWith<$Res> get deleteState;

}
/// @nodoc
class __$ConfirmDeleteCopyWithImpl<$Res>
    implements _$ConfirmDeleteCopyWith<$Res> {
  __$ConfirmDeleteCopyWithImpl(this._self, this._then);

  final _ConfirmDelete _self;
  final $Res Function(_ConfirmDelete) _then;

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isGoogleUser = null,Object? deleteState = null,}) {
  return _then(_ConfirmDelete(
isGoogleUser: null == isGoogleUser ? _self.isGoogleUser : isGoogleUser // ignore: cast_nullable_to_non_nullable
as bool,deleteState: null == deleteState ? _self.deleteState : deleteState // ignore: cast_nullable_to_non_nullable
as AsyncState,
  ));
}

/// Create a copy of DeleteAccountState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncStateCopyWith<$Res> get deleteState {
  
  return $AsyncStateCopyWith<$Res>(_self.deleteState, (value) {
    return _then(_self.copyWith(deleteState: value));
  });
}
}

// dart format on
