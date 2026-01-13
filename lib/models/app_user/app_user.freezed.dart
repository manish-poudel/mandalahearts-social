// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUser {

 String get uid; String get username; String get firstName; String get secondName; DateTime get dob; String get gender; String? get bio; String? get guruName; String? get spiritualOrganisation; String? get spiritualPractice;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.guruName, guruName) || other.guruName == guruName)&&(identical(other.spiritualOrganisation, spiritualOrganisation) || other.spiritualOrganisation == spiritualOrganisation)&&(identical(other.spiritualPractice, spiritualPractice) || other.spiritualPractice == spiritualPractice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,firstName,secondName,dob,gender,bio,guruName,spiritualOrganisation,spiritualPractice);

@override
String toString() {
  return 'AppUser(uid: $uid, username: $username, firstName: $firstName, secondName: $secondName, dob: $dob, gender: $gender, bio: $bio, guruName: $guruName, spiritualOrganisation: $spiritualOrganisation, spiritualPractice: $spiritualPractice)';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
 String uid, String username, String firstName, String secondName, DateTime dob, String gender, String? bio, String? guruName, String? spiritualOrganisation, String? spiritualPractice
});




}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? username = null,Object? firstName = null,Object? secondName = null,Object? dob = null,Object? gender = null,Object? bio = freezed,Object? guruName = freezed,Object? spiritualOrganisation = freezed,Object? spiritualPractice = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: null == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,guruName: freezed == guruName ? _self.guruName : guruName // ignore: cast_nullable_to_non_nullable
as String?,spiritualOrganisation: freezed == spiritualOrganisation ? _self.spiritualOrganisation : spiritualOrganisation // ignore: cast_nullable_to_non_nullable
as String?,spiritualPractice: freezed == spiritualPractice ? _self.spiritualPractice : spiritualPractice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUser].
extension AppUserPatterns on AppUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUser value)  $default,){
final _that = this;
switch (_that) {
case _AppUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUser value)?  $default,){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String username,  String firstName,  String secondName,  DateTime dob,  String gender,  String? bio,  String? guruName,  String? spiritualOrganisation,  String? spiritualPractice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.username,_that.firstName,_that.secondName,_that.dob,_that.gender,_that.bio,_that.guruName,_that.spiritualOrganisation,_that.spiritualPractice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String username,  String firstName,  String secondName,  DateTime dob,  String gender,  String? bio,  String? guruName,  String? spiritualOrganisation,  String? spiritualPractice)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.uid,_that.username,_that.firstName,_that.secondName,_that.dob,_that.gender,_that.bio,_that.guruName,_that.spiritualOrganisation,_that.spiritualPractice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String username,  String firstName,  String secondName,  DateTime dob,  String gender,  String? bio,  String? guruName,  String? spiritualOrganisation,  String? spiritualPractice)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.username,_that.firstName,_that.secondName,_that.dob,_that.gender,_that.bio,_that.guruName,_that.spiritualOrganisation,_that.spiritualPractice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUser implements AppUser {
  const _AppUser({required this.uid, required this.username, required this.firstName, required this.secondName, required this.dob, required this.gender, required this.bio, required this.guruName, required this.spiritualOrganisation, required this.spiritualPractice});
  factory _AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

@override final  String uid;
@override final  String username;
@override final  String firstName;
@override final  String secondName;
@override final  DateTime dob;
@override final  String gender;
@override final  String? bio;
@override final  String? guruName;
@override final  String? spiritualOrganisation;
@override final  String? spiritualPractice;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserCopyWith<_AppUser> get copyWith => __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.guruName, guruName) || other.guruName == guruName)&&(identical(other.spiritualOrganisation, spiritualOrganisation) || other.spiritualOrganisation == spiritualOrganisation)&&(identical(other.spiritualPractice, spiritualPractice) || other.spiritualPractice == spiritualPractice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,firstName,secondName,dob,gender,bio,guruName,spiritualOrganisation,spiritualPractice);

@override
String toString() {
  return 'AppUser(uid: $uid, username: $username, firstName: $firstName, secondName: $secondName, dob: $dob, gender: $gender, bio: $bio, guruName: $guruName, spiritualOrganisation: $spiritualOrganisation, spiritualPractice: $spiritualPractice)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
 String uid, String username, String firstName, String secondName, DateTime dob, String gender, String? bio, String? guruName, String? spiritualOrganisation, String? spiritualPractice
});




}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? username = null,Object? firstName = null,Object? secondName = null,Object? dob = null,Object? gender = null,Object? bio = freezed,Object? guruName = freezed,Object? spiritualOrganisation = freezed,Object? spiritualPractice = freezed,}) {
  return _then(_AppUser(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: null == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,guruName: freezed == guruName ? _self.guruName : guruName // ignore: cast_nullable_to_non_nullable
as String?,spiritualOrganisation: freezed == spiritualOrganisation ? _self.spiritualOrganisation : spiritualOrganisation // ignore: cast_nullable_to_non_nullable
as String?,spiritualPractice: freezed == spiritualPractice ? _self.spiritualPractice : spiritualPractice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
