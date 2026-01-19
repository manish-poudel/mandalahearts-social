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

 String get uid; String get username; BasicDetails? get basicDetails; String? get bio; SpiritualDetails? get spiritualDetails;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.basicDetails, basicDetails) || other.basicDetails == basicDetails)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.spiritualDetails, spiritualDetails) || other.spiritualDetails == spiritualDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,basicDetails,bio,spiritualDetails);

@override
String toString() {
  return 'AppUser(uid: $uid, username: $username, basicDetails: $basicDetails, bio: $bio, spiritualDetails: $spiritualDetails)';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
 String uid, String username, BasicDetails? basicDetails, String? bio, SpiritualDetails? spiritualDetails
});


$BasicDetailsCopyWith<$Res>? get basicDetails;$SpiritualDetailsCopyWith<$Res>? get spiritualDetails;

}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? username = null,Object? basicDetails = freezed,Object? bio = freezed,Object? spiritualDetails = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,basicDetails: freezed == basicDetails ? _self.basicDetails : basicDetails // ignore: cast_nullable_to_non_nullable
as BasicDetails?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,spiritualDetails: freezed == spiritualDetails ? _self.spiritualDetails : spiritualDetails // ignore: cast_nullable_to_non_nullable
as SpiritualDetails?,
  ));
}
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicDetailsCopyWith<$Res>? get basicDetails {
    if (_self.basicDetails == null) {
    return null;
  }

  return $BasicDetailsCopyWith<$Res>(_self.basicDetails!, (value) {
    return _then(_self.copyWith(basicDetails: value));
  });
}/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpiritualDetailsCopyWith<$Res>? get spiritualDetails {
    if (_self.spiritualDetails == null) {
    return null;
  }

  return $SpiritualDetailsCopyWith<$Res>(_self.spiritualDetails!, (value) {
    return _then(_self.copyWith(spiritualDetails: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String username,  BasicDetails? basicDetails,  String? bio,  SpiritualDetails? spiritualDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.username,_that.basicDetails,_that.bio,_that.spiritualDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String username,  BasicDetails? basicDetails,  String? bio,  SpiritualDetails? spiritualDetails)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.uid,_that.username,_that.basicDetails,_that.bio,_that.spiritualDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String username,  BasicDetails? basicDetails,  String? bio,  SpiritualDetails? spiritualDetails)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.username,_that.basicDetails,_that.bio,_that.spiritualDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUser implements AppUser {
  const _AppUser({required this.uid, required this.username, this.basicDetails, this.bio, this.spiritualDetails});
  factory _AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

@override final  String uid;
@override final  String username;
@override final  BasicDetails? basicDetails;
@override final  String? bio;
@override final  SpiritualDetails? spiritualDetails;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.basicDetails, basicDetails) || other.basicDetails == basicDetails)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.spiritualDetails, spiritualDetails) || other.spiritualDetails == spiritualDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,basicDetails,bio,spiritualDetails);

@override
String toString() {
  return 'AppUser(uid: $uid, username: $username, basicDetails: $basicDetails, bio: $bio, spiritualDetails: $spiritualDetails)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
 String uid, String username, BasicDetails? basicDetails, String? bio, SpiritualDetails? spiritualDetails
});


@override $BasicDetailsCopyWith<$Res>? get basicDetails;@override $SpiritualDetailsCopyWith<$Res>? get spiritualDetails;

}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? username = null,Object? basicDetails = freezed,Object? bio = freezed,Object? spiritualDetails = freezed,}) {
  return _then(_AppUser(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,basicDetails: freezed == basicDetails ? _self.basicDetails : basicDetails // ignore: cast_nullable_to_non_nullable
as BasicDetails?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,spiritualDetails: freezed == spiritualDetails ? _self.spiritualDetails : spiritualDetails // ignore: cast_nullable_to_non_nullable
as SpiritualDetails?,
  ));
}

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicDetailsCopyWith<$Res>? get basicDetails {
    if (_self.basicDetails == null) {
    return null;
  }

  return $BasicDetailsCopyWith<$Res>(_self.basicDetails!, (value) {
    return _then(_self.copyWith(basicDetails: value));
  });
}/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpiritualDetailsCopyWith<$Res>? get spiritualDetails {
    if (_self.spiritualDetails == null) {
    return null;
  }

  return $SpiritualDetailsCopyWith<$Res>(_self.spiritualDetails!, (value) {
    return _then(_self.copyWith(spiritualDetails: value));
  });
}
}


/// @nodoc
mixin _$BasicDetails {

 String get firstName; String get secondName;@FirestoreDateTimeConverter() DateTime get dob; String get country; String? get profilePictureUrl;
/// Create a copy of BasicDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicDetailsCopyWith<BasicDetails> get copyWith => _$BasicDetailsCopyWithImpl<BasicDetails>(this as BasicDetails, _$identity);

  /// Serializes this BasicDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicDetails&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.country, country) || other.country == country)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,secondName,dob,country,profilePictureUrl);

@override
String toString() {
  return 'BasicDetails(firstName: $firstName, secondName: $secondName, dob: $dob, country: $country, profilePictureUrl: $profilePictureUrl)';
}


}

/// @nodoc
abstract mixin class $BasicDetailsCopyWith<$Res>  {
  factory $BasicDetailsCopyWith(BasicDetails value, $Res Function(BasicDetails) _then) = _$BasicDetailsCopyWithImpl;
@useResult
$Res call({
 String firstName, String secondName,@FirestoreDateTimeConverter() DateTime dob, String country, String? profilePictureUrl
});




}
/// @nodoc
class _$BasicDetailsCopyWithImpl<$Res>
    implements $BasicDetailsCopyWith<$Res> {
  _$BasicDetailsCopyWithImpl(this._self, this._then);

  final BasicDetails _self;
  final $Res Function(BasicDetails) _then;

/// Create a copy of BasicDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? secondName = null,Object? dob = null,Object? country = null,Object? profilePictureUrl = freezed,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: null == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BasicDetails].
extension BasicDetailsPatterns on BasicDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasicDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasicDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasicDetails value)  $default,){
final _that = this;
switch (_that) {
case _BasicDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasicDetails value)?  $default,){
final _that = this;
switch (_that) {
case _BasicDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String secondName, @FirestoreDateTimeConverter()  DateTime dob,  String country,  String? profilePictureUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasicDetails() when $default != null:
return $default(_that.firstName,_that.secondName,_that.dob,_that.country,_that.profilePictureUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String secondName, @FirestoreDateTimeConverter()  DateTime dob,  String country,  String? profilePictureUrl)  $default,) {final _that = this;
switch (_that) {
case _BasicDetails():
return $default(_that.firstName,_that.secondName,_that.dob,_that.country,_that.profilePictureUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String secondName, @FirestoreDateTimeConverter()  DateTime dob,  String country,  String? profilePictureUrl)?  $default,) {final _that = this;
switch (_that) {
case _BasicDetails() when $default != null:
return $default(_that.firstName,_that.secondName,_that.dob,_that.country,_that.profilePictureUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasicDetails implements BasicDetails {
  const _BasicDetails({required this.firstName, required this.secondName, @FirestoreDateTimeConverter() required this.dob, required this.country, this.profilePictureUrl});
  factory _BasicDetails.fromJson(Map<String, dynamic> json) => _$BasicDetailsFromJson(json);

@override final  String firstName;
@override final  String secondName;
@override@FirestoreDateTimeConverter() final  DateTime dob;
@override final  String country;
@override final  String? profilePictureUrl;

/// Create a copy of BasicDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicDetailsCopyWith<_BasicDetails> get copyWith => __$BasicDetailsCopyWithImpl<_BasicDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasicDetails&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.secondName, secondName) || other.secondName == secondName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.country, country) || other.country == country)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,secondName,dob,country,profilePictureUrl);

@override
String toString() {
  return 'BasicDetails(firstName: $firstName, secondName: $secondName, dob: $dob, country: $country, profilePictureUrl: $profilePictureUrl)';
}


}

/// @nodoc
abstract mixin class _$BasicDetailsCopyWith<$Res> implements $BasicDetailsCopyWith<$Res> {
  factory _$BasicDetailsCopyWith(_BasicDetails value, $Res Function(_BasicDetails) _then) = __$BasicDetailsCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String secondName,@FirestoreDateTimeConverter() DateTime dob, String country, String? profilePictureUrl
});




}
/// @nodoc
class __$BasicDetailsCopyWithImpl<$Res>
    implements _$BasicDetailsCopyWith<$Res> {
  __$BasicDetailsCopyWithImpl(this._self, this._then);

  final _BasicDetails _self;
  final $Res Function(_BasicDetails) _then;

/// Create a copy of BasicDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? secondName = null,Object? dob = null,Object? country = null,Object? profilePictureUrl = freezed,}) {
  return _then(_BasicDetails(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,secondName: null == secondName ? _self.secondName : secondName // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SpiritualDetails {

 String? get guruName; String? get spiritualOrganisation; String? get spiritualPractice;
/// Create a copy of SpiritualDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpiritualDetailsCopyWith<SpiritualDetails> get copyWith => _$SpiritualDetailsCopyWithImpl<SpiritualDetails>(this as SpiritualDetails, _$identity);

  /// Serializes this SpiritualDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpiritualDetails&&(identical(other.guruName, guruName) || other.guruName == guruName)&&(identical(other.spiritualOrganisation, spiritualOrganisation) || other.spiritualOrganisation == spiritualOrganisation)&&(identical(other.spiritualPractice, spiritualPractice) || other.spiritualPractice == spiritualPractice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,guruName,spiritualOrganisation,spiritualPractice);

@override
String toString() {
  return 'SpiritualDetails(guruName: $guruName, spiritualOrganisation: $spiritualOrganisation, spiritualPractice: $spiritualPractice)';
}


}

/// @nodoc
abstract mixin class $SpiritualDetailsCopyWith<$Res>  {
  factory $SpiritualDetailsCopyWith(SpiritualDetails value, $Res Function(SpiritualDetails) _then) = _$SpiritualDetailsCopyWithImpl;
@useResult
$Res call({
 String? guruName, String? spiritualOrganisation, String? spiritualPractice
});




}
/// @nodoc
class _$SpiritualDetailsCopyWithImpl<$Res>
    implements $SpiritualDetailsCopyWith<$Res> {
  _$SpiritualDetailsCopyWithImpl(this._self, this._then);

  final SpiritualDetails _self;
  final $Res Function(SpiritualDetails) _then;

/// Create a copy of SpiritualDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guruName = freezed,Object? spiritualOrganisation = freezed,Object? spiritualPractice = freezed,}) {
  return _then(_self.copyWith(
guruName: freezed == guruName ? _self.guruName : guruName // ignore: cast_nullable_to_non_nullable
as String?,spiritualOrganisation: freezed == spiritualOrganisation ? _self.spiritualOrganisation : spiritualOrganisation // ignore: cast_nullable_to_non_nullable
as String?,spiritualPractice: freezed == spiritualPractice ? _self.spiritualPractice : spiritualPractice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpiritualDetails].
extension SpiritualDetailsPatterns on SpiritualDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpiritualDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpiritualDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpiritualDetails value)  $default,){
final _that = this;
switch (_that) {
case _SpiritualDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpiritualDetails value)?  $default,){
final _that = this;
switch (_that) {
case _SpiritualDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? guruName,  String? spiritualOrganisation,  String? spiritualPractice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpiritualDetails() when $default != null:
return $default(_that.guruName,_that.spiritualOrganisation,_that.spiritualPractice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? guruName,  String? spiritualOrganisation,  String? spiritualPractice)  $default,) {final _that = this;
switch (_that) {
case _SpiritualDetails():
return $default(_that.guruName,_that.spiritualOrganisation,_that.spiritualPractice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? guruName,  String? spiritualOrganisation,  String? spiritualPractice)?  $default,) {final _that = this;
switch (_that) {
case _SpiritualDetails() when $default != null:
return $default(_that.guruName,_that.spiritualOrganisation,_that.spiritualPractice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpiritualDetails implements SpiritualDetails {
  const _SpiritualDetails({this.guruName, this.spiritualOrganisation, this.spiritualPractice});
  factory _SpiritualDetails.fromJson(Map<String, dynamic> json) => _$SpiritualDetailsFromJson(json);

@override final  String? guruName;
@override final  String? spiritualOrganisation;
@override final  String? spiritualPractice;

/// Create a copy of SpiritualDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpiritualDetailsCopyWith<_SpiritualDetails> get copyWith => __$SpiritualDetailsCopyWithImpl<_SpiritualDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpiritualDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpiritualDetails&&(identical(other.guruName, guruName) || other.guruName == guruName)&&(identical(other.spiritualOrganisation, spiritualOrganisation) || other.spiritualOrganisation == spiritualOrganisation)&&(identical(other.spiritualPractice, spiritualPractice) || other.spiritualPractice == spiritualPractice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,guruName,spiritualOrganisation,spiritualPractice);

@override
String toString() {
  return 'SpiritualDetails(guruName: $guruName, spiritualOrganisation: $spiritualOrganisation, spiritualPractice: $spiritualPractice)';
}


}

/// @nodoc
abstract mixin class _$SpiritualDetailsCopyWith<$Res> implements $SpiritualDetailsCopyWith<$Res> {
  factory _$SpiritualDetailsCopyWith(_SpiritualDetails value, $Res Function(_SpiritualDetails) _then) = __$SpiritualDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? guruName, String? spiritualOrganisation, String? spiritualPractice
});




}
/// @nodoc
class __$SpiritualDetailsCopyWithImpl<$Res>
    implements _$SpiritualDetailsCopyWith<$Res> {
  __$SpiritualDetailsCopyWithImpl(this._self, this._then);

  final _SpiritualDetails _self;
  final $Res Function(_SpiritualDetails) _then;

/// Create a copy of SpiritualDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guruName = freezed,Object? spiritualOrganisation = freezed,Object? spiritualPractice = freezed,}) {
  return _then(_SpiritualDetails(
guruName: freezed == guruName ? _self.guruName : guruName // ignore: cast_nullable_to_non_nullable
as String?,spiritualOrganisation: freezed == spiritualOrganisation ? _self.spiritualOrganisation : spiritualOrganisation // ignore: cast_nullable_to_non_nullable
as String?,spiritualPractice: freezed == spiritualPractice ? _self.spiritualPractice : spiritualPractice // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
