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

 String get uid; String get username; BasicDetails? get basicDetails; String? get bio; List<SpiritualMaster>? get spiritualMasters;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.basicDetails, basicDetails) || other.basicDetails == basicDetails)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.spiritualMasters, spiritualMasters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,basicDetails,bio,const DeepCollectionEquality().hash(spiritualMasters));

@override
String toString() {
  return 'AppUser(uid: $uid, username: $username, basicDetails: $basicDetails, bio: $bio, spiritualMasters: $spiritualMasters)';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
 String uid, String username, BasicDetails? basicDetails, String? bio, List<SpiritualMaster>? spiritualMasters
});


$BasicDetailsCopyWith<$Res>? get basicDetails;

}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? username = null,Object? basicDetails = freezed,Object? bio = freezed,Object? spiritualMasters = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,basicDetails: freezed == basicDetails ? _self.basicDetails : basicDetails // ignore: cast_nullable_to_non_nullable
as BasicDetails?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,spiritualMasters: freezed == spiritualMasters ? _self.spiritualMasters : spiritualMasters // ignore: cast_nullable_to_non_nullable
as List<SpiritualMaster>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String username,  BasicDetails? basicDetails,  String? bio,  List<SpiritualMaster>? spiritualMasters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.username,_that.basicDetails,_that.bio,_that.spiritualMasters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String username,  BasicDetails? basicDetails,  String? bio,  List<SpiritualMaster>? spiritualMasters)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.uid,_that.username,_that.basicDetails,_that.bio,_that.spiritualMasters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String username,  BasicDetails? basicDetails,  String? bio,  List<SpiritualMaster>? spiritualMasters)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.username,_that.basicDetails,_that.bio,_that.spiritualMasters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUser implements AppUser {
  const _AppUser({required this.uid, required this.username, this.basicDetails, this.bio, final  List<SpiritualMaster>? spiritualMasters}): _spiritualMasters = spiritualMasters;
  factory _AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

@override final  String uid;
@override final  String username;
@override final  BasicDetails? basicDetails;
@override final  String? bio;
 final  List<SpiritualMaster>? _spiritualMasters;
@override List<SpiritualMaster>? get spiritualMasters {
  final value = _spiritualMasters;
  if (value == null) return null;
  if (_spiritualMasters is EqualUnmodifiableListView) return _spiritualMasters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.basicDetails, basicDetails) || other.basicDetails == basicDetails)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._spiritualMasters, _spiritualMasters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,basicDetails,bio,const DeepCollectionEquality().hash(_spiritualMasters));

@override
String toString() {
  return 'AppUser(uid: $uid, username: $username, basicDetails: $basicDetails, bio: $bio, spiritualMasters: $spiritualMasters)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
 String uid, String username, BasicDetails? basicDetails, String? bio, List<SpiritualMaster>? spiritualMasters
});


@override $BasicDetailsCopyWith<$Res>? get basicDetails;

}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? username = null,Object? basicDetails = freezed,Object? bio = freezed,Object? spiritualMasters = freezed,}) {
  return _then(_AppUser(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,basicDetails: freezed == basicDetails ? _self.basicDetails : basicDetails // ignore: cast_nullable_to_non_nullable
as BasicDetails?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,spiritualMasters: freezed == spiritualMasters ? _self._spiritualMasters : spiritualMasters // ignore: cast_nullable_to_non_nullable
as List<SpiritualMaster>?,
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
mixin _$SpiritualMaster {

 String get guruName; String get spiritualOrganisation; String get description;
/// Create a copy of SpiritualMaster
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpiritualMasterCopyWith<SpiritualMaster> get copyWith => _$SpiritualMasterCopyWithImpl<SpiritualMaster>(this as SpiritualMaster, _$identity);

  /// Serializes this SpiritualMaster to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpiritualMaster&&(identical(other.guruName, guruName) || other.guruName == guruName)&&(identical(other.spiritualOrganisation, spiritualOrganisation) || other.spiritualOrganisation == spiritualOrganisation)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,guruName,spiritualOrganisation,description);

@override
String toString() {
  return 'SpiritualMaster(guruName: $guruName, spiritualOrganisation: $spiritualOrganisation, description: $description)';
}


}

/// @nodoc
abstract mixin class $SpiritualMasterCopyWith<$Res>  {
  factory $SpiritualMasterCopyWith(SpiritualMaster value, $Res Function(SpiritualMaster) _then) = _$SpiritualMasterCopyWithImpl;
@useResult
$Res call({
 String guruName, String spiritualOrganisation, String description
});




}
/// @nodoc
class _$SpiritualMasterCopyWithImpl<$Res>
    implements $SpiritualMasterCopyWith<$Res> {
  _$SpiritualMasterCopyWithImpl(this._self, this._then);

  final SpiritualMaster _self;
  final $Res Function(SpiritualMaster) _then;

/// Create a copy of SpiritualMaster
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guruName = null,Object? spiritualOrganisation = null,Object? description = null,}) {
  return _then(_self.copyWith(
guruName: null == guruName ? _self.guruName : guruName // ignore: cast_nullable_to_non_nullable
as String,spiritualOrganisation: null == spiritualOrganisation ? _self.spiritualOrganisation : spiritualOrganisation // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpiritualMaster].
extension SpiritualMasterPatterns on SpiritualMaster {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpiritualMaster value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpiritualMaster() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpiritualMaster value)  $default,){
final _that = this;
switch (_that) {
case _SpiritualMaster():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpiritualMaster value)?  $default,){
final _that = this;
switch (_that) {
case _SpiritualMaster() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String guruName,  String spiritualOrganisation,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpiritualMaster() when $default != null:
return $default(_that.guruName,_that.spiritualOrganisation,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String guruName,  String spiritualOrganisation,  String description)  $default,) {final _that = this;
switch (_that) {
case _SpiritualMaster():
return $default(_that.guruName,_that.spiritualOrganisation,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String guruName,  String spiritualOrganisation,  String description)?  $default,) {final _that = this;
switch (_that) {
case _SpiritualMaster() when $default != null:
return $default(_that.guruName,_that.spiritualOrganisation,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpiritualMaster implements SpiritualMaster {
  const _SpiritualMaster({required this.guruName, required this.spiritualOrganisation, required this.description});
  factory _SpiritualMaster.fromJson(Map<String, dynamic> json) => _$SpiritualMasterFromJson(json);

@override final  String guruName;
@override final  String spiritualOrganisation;
@override final  String description;

/// Create a copy of SpiritualMaster
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpiritualMasterCopyWith<_SpiritualMaster> get copyWith => __$SpiritualMasterCopyWithImpl<_SpiritualMaster>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpiritualMasterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpiritualMaster&&(identical(other.guruName, guruName) || other.guruName == guruName)&&(identical(other.spiritualOrganisation, spiritualOrganisation) || other.spiritualOrganisation == spiritualOrganisation)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,guruName,spiritualOrganisation,description);

@override
String toString() {
  return 'SpiritualMaster(guruName: $guruName, spiritualOrganisation: $spiritualOrganisation, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SpiritualMasterCopyWith<$Res> implements $SpiritualMasterCopyWith<$Res> {
  factory _$SpiritualMasterCopyWith(_SpiritualMaster value, $Res Function(_SpiritualMaster) _then) = __$SpiritualMasterCopyWithImpl;
@override @useResult
$Res call({
 String guruName, String spiritualOrganisation, String description
});




}
/// @nodoc
class __$SpiritualMasterCopyWithImpl<$Res>
    implements _$SpiritualMasterCopyWith<$Res> {
  __$SpiritualMasterCopyWithImpl(this._self, this._then);

  final _SpiritualMaster _self;
  final $Res Function(_SpiritualMaster) _then;

/// Create a copy of SpiritualMaster
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guruName = null,Object? spiritualOrganisation = null,Object? description = null,}) {
  return _then(_SpiritualMaster(
guruName: null == guruName ? _self.guruName : guruName // ignore: cast_nullable_to_non_nullable
as String,spiritualOrganisation: null == spiritualOrganisation ? _self.spiritualOrganisation : spiritualOrganisation // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
