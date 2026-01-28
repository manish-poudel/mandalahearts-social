// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_lifecycle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLifeCycleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLifeCycleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLifeCycleState()';
}


}

/// @nodoc
class $AppLifeCycleStateCopyWith<$Res>  {
$AppLifeCycleStateCopyWith(AppLifeCycleState _, $Res Function(AppLifeCycleState) __);
}


/// Adds pattern-matching-related methods to [AppLifeCycleState].
extension AppLifeCycleStatePatterns on AppLifeCycleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _ForceUpdate value)?  forceUpdate,TResult Function( _Authenticated value)?  authenticated,TResult Function( _Unauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ForceUpdate() when forceUpdate != null:
return forceUpdate(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _ForceUpdate value)  forceUpdate,required TResult Function( _Authenticated value)  authenticated,required TResult Function( _Unauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _ForceUpdate():
return forceUpdate(_that);case _Authenticated():
return authenticated(_that);case _Unauthenticated():
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _ForceUpdate value)?  forceUpdate,TResult? Function( _Authenticated value)?  authenticated,TResult? Function( _Unauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ForceUpdate() when forceUpdate != null:
return forceUpdate(_that);case _Authenticated() when authenticated != null:
return authenticated(_that);case _Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message,  String link)?  forceUpdate,TResult Function( UserProfileState profileState)?  authenticated,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ForceUpdate() when forceUpdate != null:
return forceUpdate(_that.message,_that.link);case _Authenticated() when authenticated != null:
return authenticated(_that.profileState);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message,  String link)  forceUpdate,required TResult Function( UserProfileState profileState)  authenticated,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _ForceUpdate():
return forceUpdate(_that.message,_that.link);case _Authenticated():
return authenticated(_that.profileState);case _Unauthenticated():
return unauthenticated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message,  String link)?  forceUpdate,TResult? Function( UserProfileState profileState)?  authenticated,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ForceUpdate() when forceUpdate != null:
return forceUpdate(_that.message,_that.link);case _Authenticated() when authenticated != null:
return authenticated(_that.profileState);case _Unauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppLifeCycleState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLifeCycleState.initial()';
}


}




/// @nodoc


class _Loading implements AppLifeCycleState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLifeCycleState.loading()';
}


}




/// @nodoc


class _ForceUpdate implements AppLifeCycleState {
  const _ForceUpdate({this.message = "", this.link = ""});
  

@JsonKey() final  String message;
@JsonKey() final  String link;

/// Create a copy of AppLifeCycleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForceUpdateCopyWith<_ForceUpdate> get copyWith => __$ForceUpdateCopyWithImpl<_ForceUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForceUpdate&&(identical(other.message, message) || other.message == message)&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,message,link);

@override
String toString() {
  return 'AppLifeCycleState.forceUpdate(message: $message, link: $link)';
}


}

/// @nodoc
abstract mixin class _$ForceUpdateCopyWith<$Res> implements $AppLifeCycleStateCopyWith<$Res> {
  factory _$ForceUpdateCopyWith(_ForceUpdate value, $Res Function(_ForceUpdate) _then) = __$ForceUpdateCopyWithImpl;
@useResult
$Res call({
 String message, String link
});




}
/// @nodoc
class __$ForceUpdateCopyWithImpl<$Res>
    implements _$ForceUpdateCopyWith<$Res> {
  __$ForceUpdateCopyWithImpl(this._self, this._then);

  final _ForceUpdate _self;
  final $Res Function(_ForceUpdate) _then;

/// Create a copy of AppLifeCycleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? link = null,}) {
  return _then(_ForceUpdate(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Authenticated implements AppLifeCycleState {
  const _Authenticated({required this.profileState});
  

 final  UserProfileState profileState;

/// Create a copy of AppLifeCycleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedCopyWith<_Authenticated> get copyWith => __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Authenticated&&(identical(other.profileState, profileState) || other.profileState == profileState));
}


@override
int get hashCode => Object.hash(runtimeType,profileState);

@override
String toString() {
  return 'AppLifeCycleState.authenticated(profileState: $profileState)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res> implements $AppLifeCycleStateCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(_Authenticated value, $Res Function(_Authenticated) _then) = __$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 UserProfileState profileState
});




}
/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

/// Create a copy of AppLifeCycleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileState = null,}) {
  return _then(_Authenticated(
profileState: null == profileState ? _self.profileState : profileState // ignore: cast_nullable_to_non_nullable
as UserProfileState,
  ));
}


}

/// @nodoc


class _Unauthenticated implements AppLifeCycleState {
  const _Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLifeCycleState.unauthenticated()';
}


}




// dart format on
