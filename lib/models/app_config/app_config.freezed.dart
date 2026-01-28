// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfig {

 ForceUpdate? get forceUpdate; Versions? get versions; PasswordReset? get passwordReset;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.forceUpdate, forceUpdate) || other.forceUpdate == forceUpdate)&&(identical(other.versions, versions) || other.versions == versions)&&(identical(other.passwordReset, passwordReset) || other.passwordReset == passwordReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forceUpdate,versions,passwordReset);

@override
String toString() {
  return 'AppConfig(forceUpdate: $forceUpdate, versions: $versions, passwordReset: $passwordReset)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 ForceUpdate? forceUpdate, Versions? versions, PasswordReset? passwordReset
});


$ForceUpdateCopyWith<$Res>? get forceUpdate;$VersionsCopyWith<$Res>? get versions;$PasswordResetCopyWith<$Res>? get passwordReset;

}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? forceUpdate = freezed,Object? versions = freezed,Object? passwordReset = freezed,}) {
  return _then(_self.copyWith(
forceUpdate: freezed == forceUpdate ? _self.forceUpdate : forceUpdate // ignore: cast_nullable_to_non_nullable
as ForceUpdate?,versions: freezed == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as Versions?,passwordReset: freezed == passwordReset ? _self.passwordReset : passwordReset // ignore: cast_nullable_to_non_nullable
as PasswordReset?,
  ));
}
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForceUpdateCopyWith<$Res>? get forceUpdate {
    if (_self.forceUpdate == null) {
    return null;
  }

  return $ForceUpdateCopyWith<$Res>(_self.forceUpdate!, (value) {
    return _then(_self.copyWith(forceUpdate: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionsCopyWith<$Res>? get versions {
    if (_self.versions == null) {
    return null;
  }

  return $VersionsCopyWith<$Res>(_self.versions!, (value) {
    return _then(_self.copyWith(versions: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PasswordResetCopyWith<$Res>? get passwordReset {
    if (_self.passwordReset == null) {
    return null;
  }

  return $PasswordResetCopyWith<$Res>(_self.passwordReset!, (value) {
    return _then(_self.copyWith(passwordReset: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ForceUpdate? forceUpdate,  Versions? versions,  PasswordReset? passwordReset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.forceUpdate,_that.versions,_that.passwordReset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ForceUpdate? forceUpdate,  Versions? versions,  PasswordReset? passwordReset)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.forceUpdate,_that.versions,_that.passwordReset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ForceUpdate? forceUpdate,  Versions? versions,  PasswordReset? passwordReset)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.forceUpdate,_that.versions,_that.passwordReset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig implements AppConfig {
  const _AppConfig({required this.forceUpdate, required this.versions, required this.passwordReset});
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override final  ForceUpdate? forceUpdate;
@override final  Versions? versions;
@override final  PasswordReset? passwordReset;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.forceUpdate, forceUpdate) || other.forceUpdate == forceUpdate)&&(identical(other.versions, versions) || other.versions == versions)&&(identical(other.passwordReset, passwordReset) || other.passwordReset == passwordReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forceUpdate,versions,passwordReset);

@override
String toString() {
  return 'AppConfig(forceUpdate: $forceUpdate, versions: $versions, passwordReset: $passwordReset)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 ForceUpdate? forceUpdate, Versions? versions, PasswordReset? passwordReset
});


@override $ForceUpdateCopyWith<$Res>? get forceUpdate;@override $VersionsCopyWith<$Res>? get versions;@override $PasswordResetCopyWith<$Res>? get passwordReset;

}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? forceUpdate = freezed,Object? versions = freezed,Object? passwordReset = freezed,}) {
  return _then(_AppConfig(
forceUpdate: freezed == forceUpdate ? _self.forceUpdate : forceUpdate // ignore: cast_nullable_to_non_nullable
as ForceUpdate?,versions: freezed == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as Versions?,passwordReset: freezed == passwordReset ? _self.passwordReset : passwordReset // ignore: cast_nullable_to_non_nullable
as PasswordReset?,
  ));
}

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForceUpdateCopyWith<$Res>? get forceUpdate {
    if (_self.forceUpdate == null) {
    return null;
  }

  return $ForceUpdateCopyWith<$Res>(_self.forceUpdate!, (value) {
    return _then(_self.copyWith(forceUpdate: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionsCopyWith<$Res>? get versions {
    if (_self.versions == null) {
    return null;
  }

  return $VersionsCopyWith<$Res>(_self.versions!, (value) {
    return _then(_self.copyWith(versions: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PasswordResetCopyWith<$Res>? get passwordReset {
    if (_self.passwordReset == null) {
    return null;
  }

  return $PasswordResetCopyWith<$Res>(_self.passwordReset!, (value) {
    return _then(_self.copyWith(passwordReset: value));
  });
}
}


/// @nodoc
mixin _$ForceUpdate {

 List<String>? get versions; String? get messages; String? get updateLink;
/// Create a copy of ForceUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceUpdateCopyWith<ForceUpdate> get copyWith => _$ForceUpdateCopyWithImpl<ForceUpdate>(this as ForceUpdate, _$identity);

  /// Serializes this ForceUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceUpdate&&const DeepCollectionEquality().equals(other.versions, versions)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.updateLink, updateLink) || other.updateLink == updateLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(versions),messages,updateLink);

@override
String toString() {
  return 'ForceUpdate(versions: $versions, messages: $messages, updateLink: $updateLink)';
}


}

/// @nodoc
abstract mixin class $ForceUpdateCopyWith<$Res>  {
  factory $ForceUpdateCopyWith(ForceUpdate value, $Res Function(ForceUpdate) _then) = _$ForceUpdateCopyWithImpl;
@useResult
$Res call({
 List<String>? versions, String? messages, String? updateLink
});




}
/// @nodoc
class _$ForceUpdateCopyWithImpl<$Res>
    implements $ForceUpdateCopyWith<$Res> {
  _$ForceUpdateCopyWithImpl(this._self, this._then);

  final ForceUpdate _self;
  final $Res Function(ForceUpdate) _then;

/// Create a copy of ForceUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? versions = freezed,Object? messages = freezed,Object? updateLink = freezed,}) {
  return _then(_self.copyWith(
versions: freezed == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as List<String>?,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,updateLink: freezed == updateLink ? _self.updateLink : updateLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForceUpdate].
extension ForceUpdatePatterns on ForceUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForceUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForceUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForceUpdate value)  $default,){
final _that = this;
switch (_that) {
case _ForceUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForceUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _ForceUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? versions,  String? messages,  String? updateLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForceUpdate() when $default != null:
return $default(_that.versions,_that.messages,_that.updateLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? versions,  String? messages,  String? updateLink)  $default,) {final _that = this;
switch (_that) {
case _ForceUpdate():
return $default(_that.versions,_that.messages,_that.updateLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? versions,  String? messages,  String? updateLink)?  $default,) {final _that = this;
switch (_that) {
case _ForceUpdate() when $default != null:
return $default(_that.versions,_that.messages,_that.updateLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForceUpdate implements ForceUpdate {
  const _ForceUpdate({required final  List<String>? versions, required this.messages, required this.updateLink}): _versions = versions;
  factory _ForceUpdate.fromJson(Map<String, dynamic> json) => _$ForceUpdateFromJson(json);

 final  List<String>? _versions;
@override List<String>? get versions {
  final value = _versions;
  if (value == null) return null;
  if (_versions is EqualUnmodifiableListView) return _versions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? messages;
@override final  String? updateLink;

/// Create a copy of ForceUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForceUpdateCopyWith<_ForceUpdate> get copyWith => __$ForceUpdateCopyWithImpl<_ForceUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForceUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForceUpdate&&const DeepCollectionEquality().equals(other._versions, _versions)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.updateLink, updateLink) || other.updateLink == updateLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_versions),messages,updateLink);

@override
String toString() {
  return 'ForceUpdate(versions: $versions, messages: $messages, updateLink: $updateLink)';
}


}

/// @nodoc
abstract mixin class _$ForceUpdateCopyWith<$Res> implements $ForceUpdateCopyWith<$Res> {
  factory _$ForceUpdateCopyWith(_ForceUpdate value, $Res Function(_ForceUpdate) _then) = __$ForceUpdateCopyWithImpl;
@override @useResult
$Res call({
 List<String>? versions, String? messages, String? updateLink
});




}
/// @nodoc
class __$ForceUpdateCopyWithImpl<$Res>
    implements _$ForceUpdateCopyWith<$Res> {
  __$ForceUpdateCopyWithImpl(this._self, this._then);

  final _ForceUpdate _self;
  final $Res Function(_ForceUpdate) _then;

/// Create a copy of ForceUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? versions = freezed,Object? messages = freezed,Object? updateLink = freezed,}) {
  return _then(_ForceUpdate(
versions: freezed == versions ? _self._versions : versions // ignore: cast_nullable_to_non_nullable
as List<String>?,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,updateLink: freezed == updateLink ? _self.updateLink : updateLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Versions {

 Basics? get basics;
/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionsCopyWith<Versions> get copyWith => _$VersionsCopyWithImpl<Versions>(this as Versions, _$identity);

  /// Serializes this Versions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Versions&&(identical(other.basics, basics) || other.basics == basics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,basics);

@override
String toString() {
  return 'Versions(basics: $basics)';
}


}

/// @nodoc
abstract mixin class $VersionsCopyWith<$Res>  {
  factory $VersionsCopyWith(Versions value, $Res Function(Versions) _then) = _$VersionsCopyWithImpl;
@useResult
$Res call({
 Basics? basics
});


$BasicsCopyWith<$Res>? get basics;

}
/// @nodoc
class _$VersionsCopyWithImpl<$Res>
    implements $VersionsCopyWith<$Res> {
  _$VersionsCopyWithImpl(this._self, this._then);

  final Versions _self;
  final $Res Function(Versions) _then;

/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? basics = freezed,}) {
  return _then(_self.copyWith(
basics: freezed == basics ? _self.basics : basics // ignore: cast_nullable_to_non_nullable
as Basics?,
  ));
}
/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicsCopyWith<$Res>? get basics {
    if (_self.basics == null) {
    return null;
  }

  return $BasicsCopyWith<$Res>(_self.basics!, (value) {
    return _then(_self.copyWith(basics: value));
  });
}
}


/// Adds pattern-matching-related methods to [Versions].
extension VersionsPatterns on Versions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Versions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Versions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Versions value)  $default,){
final _that = this;
switch (_that) {
case _Versions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Versions value)?  $default,){
final _that = this;
switch (_that) {
case _Versions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Basics? basics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Versions() when $default != null:
return $default(_that.basics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Basics? basics)  $default,) {final _that = this;
switch (_that) {
case _Versions():
return $default(_that.basics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Basics? basics)?  $default,) {final _that = this;
switch (_that) {
case _Versions() when $default != null:
return $default(_that.basics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Versions implements Versions {
  const _Versions({required this.basics});
  factory _Versions.fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);

@override final  Basics? basics;

/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionsCopyWith<_Versions> get copyWith => __$VersionsCopyWithImpl<_Versions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Versions&&(identical(other.basics, basics) || other.basics == basics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,basics);

@override
String toString() {
  return 'Versions(basics: $basics)';
}


}

/// @nodoc
abstract mixin class _$VersionsCopyWith<$Res> implements $VersionsCopyWith<$Res> {
  factory _$VersionsCopyWith(_Versions value, $Res Function(_Versions) _then) = __$VersionsCopyWithImpl;
@override @useResult
$Res call({
 Basics? basics
});


@override $BasicsCopyWith<$Res>? get basics;

}
/// @nodoc
class __$VersionsCopyWithImpl<$Res>
    implements _$VersionsCopyWith<$Res> {
  __$VersionsCopyWithImpl(this._self, this._then);

  final _Versions _self;
  final $Res Function(_Versions) _then;

/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? basics = freezed,}) {
  return _then(_Versions(
basics: freezed == basics ? _self.basics : basics // ignore: cast_nullable_to_non_nullable
as Basics?,
  ));
}

/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasicsCopyWith<$Res>? get basics {
    if (_self.basics == null) {
    return null;
  }

  return $BasicsCopyWith<$Res>(_self.basics!, (value) {
    return _then(_self.copyWith(basics: value));
  });
}
}


/// @nodoc
mixin _$Basics {

 Limits? get limits;
/// Create a copy of Basics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicsCopyWith<Basics> get copyWith => _$BasicsCopyWithImpl<Basics>(this as Basics, _$identity);

  /// Serializes this Basics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Basics&&(identical(other.limits, limits) || other.limits == limits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limits);

@override
String toString() {
  return 'Basics(limits: $limits)';
}


}

/// @nodoc
abstract mixin class $BasicsCopyWith<$Res>  {
  factory $BasicsCopyWith(Basics value, $Res Function(Basics) _then) = _$BasicsCopyWithImpl;
@useResult
$Res call({
 Limits? limits
});


$LimitsCopyWith<$Res>? get limits;

}
/// @nodoc
class _$BasicsCopyWithImpl<$Res>
    implements $BasicsCopyWith<$Res> {
  _$BasicsCopyWithImpl(this._self, this._then);

  final Basics _self;
  final $Res Function(Basics) _then;

/// Create a copy of Basics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limits = freezed,}) {
  return _then(_self.copyWith(
limits: freezed == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as Limits?,
  ));
}
/// Create a copy of Basics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LimitsCopyWith<$Res>? get limits {
    if (_self.limits == null) {
    return null;
  }

  return $LimitsCopyWith<$Res>(_self.limits!, (value) {
    return _then(_self.copyWith(limits: value));
  });
}
}


/// Adds pattern-matching-related methods to [Basics].
extension BasicsPatterns on Basics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Basics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Basics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Basics value)  $default,){
final _that = this;
switch (_that) {
case _Basics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Basics value)?  $default,){
final _that = this;
switch (_that) {
case _Basics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Limits? limits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Basics() when $default != null:
return $default(_that.limits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Limits? limits)  $default,) {final _that = this;
switch (_that) {
case _Basics():
return $default(_that.limits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Limits? limits)?  $default,) {final _that = this;
switch (_that) {
case _Basics() when $default != null:
return $default(_that.limits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Basics implements Basics {
  const _Basics({required this.limits});
  factory _Basics.fromJson(Map<String, dynamic> json) => _$BasicsFromJson(json);

@override final  Limits? limits;

/// Create a copy of Basics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasicsCopyWith<_Basics> get copyWith => __$BasicsCopyWithImpl<_Basics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasicsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Basics&&(identical(other.limits, limits) || other.limits == limits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limits);

@override
String toString() {
  return 'Basics(limits: $limits)';
}


}

/// @nodoc
abstract mixin class _$BasicsCopyWith<$Res> implements $BasicsCopyWith<$Res> {
  factory _$BasicsCopyWith(_Basics value, $Res Function(_Basics) _then) = __$BasicsCopyWithImpl;
@override @useResult
$Res call({
 Limits? limits
});


@override $LimitsCopyWith<$Res>? get limits;

}
/// @nodoc
class __$BasicsCopyWithImpl<$Res>
    implements _$BasicsCopyWith<$Res> {
  __$BasicsCopyWithImpl(this._self, this._then);

  final _Basics _self;
  final $Res Function(_Basics) _then;

/// Create a copy of Basics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limits = freezed,}) {
  return _then(_Basics(
limits: freezed == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as Limits?,
  ));
}

/// Create a copy of Basics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LimitsCopyWith<$Res>? get limits {
    if (_self.limits == null) {
    return null;
  }

  return $LimitsCopyWith<$Res>(_self.limits!, (value) {
    return _then(_self.copyWith(limits: value));
  });
}
}


/// @nodoc
mixin _$Limits {

@JsonKey(name: 'create_spiritual_masters') int? get createSpiritualMasters;
/// Create a copy of Limits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LimitsCopyWith<Limits> get copyWith => _$LimitsCopyWithImpl<Limits>(this as Limits, _$identity);

  /// Serializes this Limits to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Limits&&(identical(other.createSpiritualMasters, createSpiritualMasters) || other.createSpiritualMasters == createSpiritualMasters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createSpiritualMasters);

@override
String toString() {
  return 'Limits(createSpiritualMasters: $createSpiritualMasters)';
}


}

/// @nodoc
abstract mixin class $LimitsCopyWith<$Res>  {
  factory $LimitsCopyWith(Limits value, $Res Function(Limits) _then) = _$LimitsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'create_spiritual_masters') int? createSpiritualMasters
});




}
/// @nodoc
class _$LimitsCopyWithImpl<$Res>
    implements $LimitsCopyWith<$Res> {
  _$LimitsCopyWithImpl(this._self, this._then);

  final Limits _self;
  final $Res Function(Limits) _then;

/// Create a copy of Limits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createSpiritualMasters = freezed,}) {
  return _then(_self.copyWith(
createSpiritualMasters: freezed == createSpiritualMasters ? _self.createSpiritualMasters : createSpiritualMasters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Limits].
extension LimitsPatterns on Limits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Limits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Limits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Limits value)  $default,){
final _that = this;
switch (_that) {
case _Limits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Limits value)?  $default,){
final _that = this;
switch (_that) {
case _Limits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'create_spiritual_masters')  int? createSpiritualMasters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Limits() when $default != null:
return $default(_that.createSpiritualMasters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'create_spiritual_masters')  int? createSpiritualMasters)  $default,) {final _that = this;
switch (_that) {
case _Limits():
return $default(_that.createSpiritualMasters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'create_spiritual_masters')  int? createSpiritualMasters)?  $default,) {final _that = this;
switch (_that) {
case _Limits() when $default != null:
return $default(_that.createSpiritualMasters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Limits implements Limits {
  const _Limits({@JsonKey(name: 'create_spiritual_masters') required this.createSpiritualMasters});
  factory _Limits.fromJson(Map<String, dynamic> json) => _$LimitsFromJson(json);

@override@JsonKey(name: 'create_spiritual_masters') final  int? createSpiritualMasters;

/// Create a copy of Limits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LimitsCopyWith<_Limits> get copyWith => __$LimitsCopyWithImpl<_Limits>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LimitsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Limits&&(identical(other.createSpiritualMasters, createSpiritualMasters) || other.createSpiritualMasters == createSpiritualMasters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createSpiritualMasters);

@override
String toString() {
  return 'Limits(createSpiritualMasters: $createSpiritualMasters)';
}


}

/// @nodoc
abstract mixin class _$LimitsCopyWith<$Res> implements $LimitsCopyWith<$Res> {
  factory _$LimitsCopyWith(_Limits value, $Res Function(_Limits) _then) = __$LimitsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'create_spiritual_masters') int? createSpiritualMasters
});




}
/// @nodoc
class __$LimitsCopyWithImpl<$Res>
    implements _$LimitsCopyWith<$Res> {
  __$LimitsCopyWithImpl(this._self, this._then);

  final _Limits _self;
  final $Res Function(_Limits) _then;

/// Create a copy of Limits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createSpiritualMasters = freezed,}) {
  return _then(_Limits(
createSpiritualMasters: freezed == createSpiritualMasters ? _self.createSpiritualMasters : createSpiritualMasters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PasswordReset {

 bool get handleCodeInApp; String get passwordResetUrl;
/// Create a copy of PasswordReset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetCopyWith<PasswordReset> get copyWith => _$PasswordResetCopyWithImpl<PasswordReset>(this as PasswordReset, _$identity);

  /// Serializes this PasswordReset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordReset&&(identical(other.handleCodeInApp, handleCodeInApp) || other.handleCodeInApp == handleCodeInApp)&&(identical(other.passwordResetUrl, passwordResetUrl) || other.passwordResetUrl == passwordResetUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,handleCodeInApp,passwordResetUrl);

@override
String toString() {
  return 'PasswordReset(handleCodeInApp: $handleCodeInApp, passwordResetUrl: $passwordResetUrl)';
}


}

/// @nodoc
abstract mixin class $PasswordResetCopyWith<$Res>  {
  factory $PasswordResetCopyWith(PasswordReset value, $Res Function(PasswordReset) _then) = _$PasswordResetCopyWithImpl;
@useResult
$Res call({
 bool handleCodeInApp, String passwordResetUrl
});




}
/// @nodoc
class _$PasswordResetCopyWithImpl<$Res>
    implements $PasswordResetCopyWith<$Res> {
  _$PasswordResetCopyWithImpl(this._self, this._then);

  final PasswordReset _self;
  final $Res Function(PasswordReset) _then;

/// Create a copy of PasswordReset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? handleCodeInApp = null,Object? passwordResetUrl = null,}) {
  return _then(_self.copyWith(
handleCodeInApp: null == handleCodeInApp ? _self.handleCodeInApp : handleCodeInApp // ignore: cast_nullable_to_non_nullable
as bool,passwordResetUrl: null == passwordResetUrl ? _self.passwordResetUrl : passwordResetUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordReset].
extension PasswordResetPatterns on PasswordReset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordReset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordReset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordReset value)  $default,){
final _that = this;
switch (_that) {
case _PasswordReset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordReset value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordReset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool handleCodeInApp,  String passwordResetUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordReset() when $default != null:
return $default(_that.handleCodeInApp,_that.passwordResetUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool handleCodeInApp,  String passwordResetUrl)  $default,) {final _that = this;
switch (_that) {
case _PasswordReset():
return $default(_that.handleCodeInApp,_that.passwordResetUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool handleCodeInApp,  String passwordResetUrl)?  $default,) {final _that = this;
switch (_that) {
case _PasswordReset() when $default != null:
return $default(_that.handleCodeInApp,_that.passwordResetUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PasswordReset implements PasswordReset {
  const _PasswordReset({required this.handleCodeInApp, required this.passwordResetUrl});
  factory _PasswordReset.fromJson(Map<String, dynamic> json) => _$PasswordResetFromJson(json);

@override final  bool handleCodeInApp;
@override final  String passwordResetUrl;

/// Create a copy of PasswordReset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordResetCopyWith<_PasswordReset> get copyWith => __$PasswordResetCopyWithImpl<_PasswordReset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordResetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordReset&&(identical(other.handleCodeInApp, handleCodeInApp) || other.handleCodeInApp == handleCodeInApp)&&(identical(other.passwordResetUrl, passwordResetUrl) || other.passwordResetUrl == passwordResetUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,handleCodeInApp,passwordResetUrl);

@override
String toString() {
  return 'PasswordReset(handleCodeInApp: $handleCodeInApp, passwordResetUrl: $passwordResetUrl)';
}


}

/// @nodoc
abstract mixin class _$PasswordResetCopyWith<$Res> implements $PasswordResetCopyWith<$Res> {
  factory _$PasswordResetCopyWith(_PasswordReset value, $Res Function(_PasswordReset) _then) = __$PasswordResetCopyWithImpl;
@override @useResult
$Res call({
 bool handleCodeInApp, String passwordResetUrl
});




}
/// @nodoc
class __$PasswordResetCopyWithImpl<$Res>
    implements _$PasswordResetCopyWith<$Res> {
  __$PasswordResetCopyWithImpl(this._self, this._then);

  final _PasswordReset _self;
  final $Res Function(_PasswordReset) _then;

/// Create a copy of PasswordReset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? handleCodeInApp = null,Object? passwordResetUrl = null,}) {
  return _then(_PasswordReset(
handleCodeInApp: null == handleCodeInApp ? _self.handleCodeInApp : handleCodeInApp // ignore: cast_nullable_to_non_nullable
as bool,passwordResetUrl: null == passwordResetUrl ? _self.passwordResetUrl : passwordResetUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
