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

 AppInfo? get app; Versions? get versions; Restrictions? get restrictions;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.app, app) || other.app == app)&&(identical(other.versions, versions) || other.versions == versions)&&(identical(other.restrictions, restrictions) || other.restrictions == restrictions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,versions,restrictions);

@override
String toString() {
  return 'AppConfig(app: $app, versions: $versions, restrictions: $restrictions)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 AppInfo? app, Versions? versions, Restrictions? restrictions
});


$AppInfoCopyWith<$Res>? get app;$VersionsCopyWith<$Res>? get versions;$RestrictionsCopyWith<$Res>? get restrictions;

}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? app = freezed,Object? versions = freezed,Object? restrictions = freezed,}) {
  return _then(_self.copyWith(
app: freezed == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as AppInfo?,versions: freezed == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as Versions?,restrictions: freezed == restrictions ? _self.restrictions : restrictions // ignore: cast_nullable_to_non_nullable
as Restrictions?,
  ));
}
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res>? get app {
    if (_self.app == null) {
    return null;
  }

  return $AppInfoCopyWith<$Res>(_self.app!, (value) {
    return _then(_self.copyWith(app: value));
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
$RestrictionsCopyWith<$Res>? get restrictions {
    if (_self.restrictions == null) {
    return null;
  }

  return $RestrictionsCopyWith<$Res>(_self.restrictions!, (value) {
    return _then(_self.copyWith(restrictions: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppInfo? app,  Versions? versions,  Restrictions? restrictions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.app,_that.versions,_that.restrictions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppInfo? app,  Versions? versions,  Restrictions? restrictions)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.app,_that.versions,_that.restrictions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppInfo? app,  Versions? versions,  Restrictions? restrictions)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.app,_that.versions,_that.restrictions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig implements AppConfig {
  const _AppConfig({required this.app, required this.versions, required this.restrictions});
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override final  AppInfo? app;
@override final  Versions? versions;
@override final  Restrictions? restrictions;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.app, app) || other.app == app)&&(identical(other.versions, versions) || other.versions == versions)&&(identical(other.restrictions, restrictions) || other.restrictions == restrictions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,app,versions,restrictions);

@override
String toString() {
  return 'AppConfig(app: $app, versions: $versions, restrictions: $restrictions)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 AppInfo? app, Versions? versions, Restrictions? restrictions
});


@override $AppInfoCopyWith<$Res>? get app;@override $VersionsCopyWith<$Res>? get versions;@override $RestrictionsCopyWith<$Res>? get restrictions;

}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? app = freezed,Object? versions = freezed,Object? restrictions = freezed,}) {
  return _then(_AppConfig(
app: freezed == app ? _self.app : app // ignore: cast_nullable_to_non_nullable
as AppInfo?,versions: freezed == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as Versions?,restrictions: freezed == restrictions ? _self.restrictions : restrictions // ignore: cast_nullable_to_non_nullable
as Restrictions?,
  ));
}

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res>? get app {
    if (_self.app == null) {
    return null;
  }

  return $AppInfoCopyWith<$Res>(_self.app!, (value) {
    return _then(_self.copyWith(app: value));
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
$RestrictionsCopyWith<$Res>? get restrictions {
    if (_self.restrictions == null) {
    return null;
  }

  return $RestrictionsCopyWith<$Res>(_self.restrictions!, (value) {
    return _then(_self.copyWith(restrictions: value));
  });
}
}


/// @nodoc
mixin _$AppInfo {

 List<String>? get forceUpdateVersions; String? get forceUpdateMessage; String? get forceUpdateLink; String? get privacyPolicyLink; String? get termsAndConditionsLink;
/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoCopyWith<AppInfo> get copyWith => _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);

  /// Serializes this AppInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfo&&const DeepCollectionEquality().equals(other.forceUpdateVersions, forceUpdateVersions)&&(identical(other.forceUpdateMessage, forceUpdateMessage) || other.forceUpdateMessage == forceUpdateMessage)&&(identical(other.forceUpdateLink, forceUpdateLink) || other.forceUpdateLink == forceUpdateLink)&&(identical(other.privacyPolicyLink, privacyPolicyLink) || other.privacyPolicyLink == privacyPolicyLink)&&(identical(other.termsAndConditionsLink, termsAndConditionsLink) || other.termsAndConditionsLink == termsAndConditionsLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(forceUpdateVersions),forceUpdateMessage,forceUpdateLink,privacyPolicyLink,termsAndConditionsLink);

@override
String toString() {
  return 'AppInfo(forceUpdateVersions: $forceUpdateVersions, forceUpdateMessage: $forceUpdateMessage, forceUpdateLink: $forceUpdateLink, privacyPolicyLink: $privacyPolicyLink, termsAndConditionsLink: $termsAndConditionsLink)';
}


}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res>  {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) = _$AppInfoCopyWithImpl;
@useResult
$Res call({
 List<String>? forceUpdateVersions, String? forceUpdateMessage, String? forceUpdateLink, String? privacyPolicyLink, String? termsAndConditionsLink
});




}
/// @nodoc
class _$AppInfoCopyWithImpl<$Res>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? forceUpdateVersions = freezed,Object? forceUpdateMessage = freezed,Object? forceUpdateLink = freezed,Object? privacyPolicyLink = freezed,Object? termsAndConditionsLink = freezed,}) {
  return _then(_self.copyWith(
forceUpdateVersions: freezed == forceUpdateVersions ? _self.forceUpdateVersions : forceUpdateVersions // ignore: cast_nullable_to_non_nullable
as List<String>?,forceUpdateMessage: freezed == forceUpdateMessage ? _self.forceUpdateMessage : forceUpdateMessage // ignore: cast_nullable_to_non_nullable
as String?,forceUpdateLink: freezed == forceUpdateLink ? _self.forceUpdateLink : forceUpdateLink // ignore: cast_nullable_to_non_nullable
as String?,privacyPolicyLink: freezed == privacyPolicyLink ? _self.privacyPolicyLink : privacyPolicyLink // ignore: cast_nullable_to_non_nullable
as String?,termsAndConditionsLink: freezed == termsAndConditionsLink ? _self.termsAndConditionsLink : termsAndConditionsLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? forceUpdateVersions,  String? forceUpdateMessage,  String? forceUpdateLink,  String? privacyPolicyLink,  String? termsAndConditionsLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.forceUpdateVersions,_that.forceUpdateMessage,_that.forceUpdateLink,_that.privacyPolicyLink,_that.termsAndConditionsLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? forceUpdateVersions,  String? forceUpdateMessage,  String? forceUpdateLink,  String? privacyPolicyLink,  String? termsAndConditionsLink)  $default,) {final _that = this;
switch (_that) {
case _AppInfo():
return $default(_that.forceUpdateVersions,_that.forceUpdateMessage,_that.forceUpdateLink,_that.privacyPolicyLink,_that.termsAndConditionsLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? forceUpdateVersions,  String? forceUpdateMessage,  String? forceUpdateLink,  String? privacyPolicyLink,  String? termsAndConditionsLink)?  $default,) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.forceUpdateVersions,_that.forceUpdateMessage,_that.forceUpdateLink,_that.privacyPolicyLink,_that.termsAndConditionsLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppInfo implements AppInfo {
  const _AppInfo({required final  List<String>? forceUpdateVersions, required this.forceUpdateMessage, required this.forceUpdateLink, required this.privacyPolicyLink, required this.termsAndConditionsLink}): _forceUpdateVersions = forceUpdateVersions;
  factory _AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);

 final  List<String>? _forceUpdateVersions;
@override List<String>? get forceUpdateVersions {
  final value = _forceUpdateVersions;
  if (value == null) return null;
  if (_forceUpdateVersions is EqualUnmodifiableListView) return _forceUpdateVersions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? forceUpdateMessage;
@override final  String? forceUpdateLink;
@override final  String? privacyPolicyLink;
@override final  String? termsAndConditionsLink;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoCopyWith<_AppInfo> get copyWith => __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfo&&const DeepCollectionEquality().equals(other._forceUpdateVersions, _forceUpdateVersions)&&(identical(other.forceUpdateMessage, forceUpdateMessage) || other.forceUpdateMessage == forceUpdateMessage)&&(identical(other.forceUpdateLink, forceUpdateLink) || other.forceUpdateLink == forceUpdateLink)&&(identical(other.privacyPolicyLink, privacyPolicyLink) || other.privacyPolicyLink == privacyPolicyLink)&&(identical(other.termsAndConditionsLink, termsAndConditionsLink) || other.termsAndConditionsLink == termsAndConditionsLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_forceUpdateVersions),forceUpdateMessage,forceUpdateLink,privacyPolicyLink,termsAndConditionsLink);

@override
String toString() {
  return 'AppInfo(forceUpdateVersions: $forceUpdateVersions, forceUpdateMessage: $forceUpdateMessage, forceUpdateLink: $forceUpdateLink, privacyPolicyLink: $privacyPolicyLink, termsAndConditionsLink: $termsAndConditionsLink)';
}


}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) = __$AppInfoCopyWithImpl;
@override @useResult
$Res call({
 List<String>? forceUpdateVersions, String? forceUpdateMessage, String? forceUpdateLink, String? privacyPolicyLink, String? termsAndConditionsLink
});




}
/// @nodoc
class __$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? forceUpdateVersions = freezed,Object? forceUpdateMessage = freezed,Object? forceUpdateLink = freezed,Object? privacyPolicyLink = freezed,Object? termsAndConditionsLink = freezed,}) {
  return _then(_AppInfo(
forceUpdateVersions: freezed == forceUpdateVersions ? _self._forceUpdateVersions : forceUpdateVersions // ignore: cast_nullable_to_non_nullable
as List<String>?,forceUpdateMessage: freezed == forceUpdateMessage ? _self.forceUpdateMessage : forceUpdateMessage // ignore: cast_nullable_to_non_nullable
as String?,forceUpdateLink: freezed == forceUpdateLink ? _self.forceUpdateLink : forceUpdateLink // ignore: cast_nullable_to_non_nullable
as String?,privacyPolicyLink: freezed == privacyPolicyLink ? _self.privacyPolicyLink : privacyPolicyLink // ignore: cast_nullable_to_non_nullable
as String?,termsAndConditionsLink: freezed == termsAndConditionsLink ? _self.termsAndConditionsLink : termsAndConditionsLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Versions {

 PlanLimits? get basics;
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
 PlanLimits? basics
});


$PlanLimitsCopyWith<$Res>? get basics;

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
as PlanLimits?,
  ));
}
/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanLimitsCopyWith<$Res>? get basics {
    if (_self.basics == null) {
    return null;
  }

  return $PlanLimitsCopyWith<$Res>(_self.basics!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlanLimits? basics)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlanLimits? basics)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlanLimits? basics)?  $default,) {final _that = this;
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

@override final  PlanLimits? basics;

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
 PlanLimits? basics
});


@override $PlanLimitsCopyWith<$Res>? get basics;

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
as PlanLimits?,
  ));
}

/// Create a copy of Versions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanLimitsCopyWith<$Res>? get basics {
    if (_self.basics == null) {
    return null;
  }

  return $PlanLimitsCopyWith<$Res>(_self.basics!, (value) {
    return _then(_self.copyWith(basics: value));
  });
}
}


/// @nodoc
mixin _$PlanLimits {

 int? get createSpiritualMasters;
/// Create a copy of PlanLimits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanLimitsCopyWith<PlanLimits> get copyWith => _$PlanLimitsCopyWithImpl<PlanLimits>(this as PlanLimits, _$identity);

  /// Serializes this PlanLimits to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanLimits&&(identical(other.createSpiritualMasters, createSpiritualMasters) || other.createSpiritualMasters == createSpiritualMasters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createSpiritualMasters);

@override
String toString() {
  return 'PlanLimits(createSpiritualMasters: $createSpiritualMasters)';
}


}

/// @nodoc
abstract mixin class $PlanLimitsCopyWith<$Res>  {
  factory $PlanLimitsCopyWith(PlanLimits value, $Res Function(PlanLimits) _then) = _$PlanLimitsCopyWithImpl;
@useResult
$Res call({
 int? createSpiritualMasters
});




}
/// @nodoc
class _$PlanLimitsCopyWithImpl<$Res>
    implements $PlanLimitsCopyWith<$Res> {
  _$PlanLimitsCopyWithImpl(this._self, this._then);

  final PlanLimits _self;
  final $Res Function(PlanLimits) _then;

/// Create a copy of PlanLimits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createSpiritualMasters = freezed,}) {
  return _then(_self.copyWith(
createSpiritualMasters: freezed == createSpiritualMasters ? _self.createSpiritualMasters : createSpiritualMasters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanLimits].
extension PlanLimitsPatterns on PlanLimits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanLimits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanLimits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanLimits value)  $default,){
final _that = this;
switch (_that) {
case _PlanLimits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanLimits value)?  $default,){
final _that = this;
switch (_that) {
case _PlanLimits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? createSpiritualMasters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanLimits() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? createSpiritualMasters)  $default,) {final _that = this;
switch (_that) {
case _PlanLimits():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? createSpiritualMasters)?  $default,) {final _that = this;
switch (_that) {
case _PlanLimits() when $default != null:
return $default(_that.createSpiritualMasters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanLimits implements PlanLimits {
  const _PlanLimits({required this.createSpiritualMasters});
  factory _PlanLimits.fromJson(Map<String, dynamic> json) => _$PlanLimitsFromJson(json);

@override final  int? createSpiritualMasters;

/// Create a copy of PlanLimits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanLimitsCopyWith<_PlanLimits> get copyWith => __$PlanLimitsCopyWithImpl<_PlanLimits>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanLimitsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanLimits&&(identical(other.createSpiritualMasters, createSpiritualMasters) || other.createSpiritualMasters == createSpiritualMasters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createSpiritualMasters);

@override
String toString() {
  return 'PlanLimits(createSpiritualMasters: $createSpiritualMasters)';
}


}

/// @nodoc
abstract mixin class _$PlanLimitsCopyWith<$Res> implements $PlanLimitsCopyWith<$Res> {
  factory _$PlanLimitsCopyWith(_PlanLimits value, $Res Function(_PlanLimits) _then) = __$PlanLimitsCopyWithImpl;
@override @useResult
$Res call({
 int? createSpiritualMasters
});




}
/// @nodoc
class __$PlanLimitsCopyWithImpl<$Res>
    implements _$PlanLimitsCopyWith<$Res> {
  __$PlanLimitsCopyWithImpl(this._self, this._then);

  final _PlanLimits _self;
  final $Res Function(_PlanLimits) _then;

/// Create a copy of PlanLimits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createSpiritualMasters = freezed,}) {
  return _then(_PlanLimits(
createSpiritualMasters: freezed == createSpiritualMasters ? _self.createSpiritualMasters : createSpiritualMasters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Restrictions {

 PostRestrictions? get post;
/// Create a copy of Restrictions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestrictionsCopyWith<Restrictions> get copyWith => _$RestrictionsCopyWithImpl<Restrictions>(this as Restrictions, _$identity);

  /// Serializes this Restrictions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restrictions&&(identical(other.post, post) || other.post == post));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'Restrictions(post: $post)';
}


}

/// @nodoc
abstract mixin class $RestrictionsCopyWith<$Res>  {
  factory $RestrictionsCopyWith(Restrictions value, $Res Function(Restrictions) _then) = _$RestrictionsCopyWithImpl;
@useResult
$Res call({
 PostRestrictions? post
});


$PostRestrictionsCopyWith<$Res>? get post;

}
/// @nodoc
class _$RestrictionsCopyWithImpl<$Res>
    implements $RestrictionsCopyWith<$Res> {
  _$RestrictionsCopyWithImpl(this._self, this._then);

  final Restrictions _self;
  final $Res Function(Restrictions) _then;

/// Create a copy of Restrictions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = freezed,}) {
  return _then(_self.copyWith(
post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostRestrictions?,
  ));
}
/// Create a copy of Restrictions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostRestrictionsCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostRestrictionsCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// Adds pattern-matching-related methods to [Restrictions].
extension RestrictionsPatterns on Restrictions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Restrictions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Restrictions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Restrictions value)  $default,){
final _that = this;
switch (_that) {
case _Restrictions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Restrictions value)?  $default,){
final _that = this;
switch (_that) {
case _Restrictions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PostRestrictions? post)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restrictions() when $default != null:
return $default(_that.post);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PostRestrictions? post)  $default,) {final _that = this;
switch (_that) {
case _Restrictions():
return $default(_that.post);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PostRestrictions? post)?  $default,) {final _that = this;
switch (_that) {
case _Restrictions() when $default != null:
return $default(_that.post);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restrictions implements Restrictions {
  const _Restrictions({required this.post});
  factory _Restrictions.fromJson(Map<String, dynamic> json) => _$RestrictionsFromJson(json);

@override final  PostRestrictions? post;

/// Create a copy of Restrictions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestrictionsCopyWith<_Restrictions> get copyWith => __$RestrictionsCopyWithImpl<_Restrictions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestrictionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restrictions&&(identical(other.post, post) || other.post == post));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'Restrictions(post: $post)';
}


}

/// @nodoc
abstract mixin class _$RestrictionsCopyWith<$Res> implements $RestrictionsCopyWith<$Res> {
  factory _$RestrictionsCopyWith(_Restrictions value, $Res Function(_Restrictions) _then) = __$RestrictionsCopyWithImpl;
@override @useResult
$Res call({
 PostRestrictions? post
});


@override $PostRestrictionsCopyWith<$Res>? get post;

}
/// @nodoc
class __$RestrictionsCopyWithImpl<$Res>
    implements _$RestrictionsCopyWith<$Res> {
  __$RestrictionsCopyWithImpl(this._self, this._then);

  final _Restrictions _self;
  final $Res Function(_Restrictions) _then;

/// Create a copy of Restrictions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = freezed,}) {
  return _then(_Restrictions(
post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as PostRestrictions?,
  ));
}

/// Create a copy of Restrictions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostRestrictionsCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostRestrictionsCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// @nodoc
mixin _$PostRestrictions {

 bool? get requireVerifiedAccount;
/// Create a copy of PostRestrictions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostRestrictionsCopyWith<PostRestrictions> get copyWith => _$PostRestrictionsCopyWithImpl<PostRestrictions>(this as PostRestrictions, _$identity);

  /// Serializes this PostRestrictions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostRestrictions&&(identical(other.requireVerifiedAccount, requireVerifiedAccount) || other.requireVerifiedAccount == requireVerifiedAccount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requireVerifiedAccount);

@override
String toString() {
  return 'PostRestrictions(requireVerifiedAccount: $requireVerifiedAccount)';
}


}

/// @nodoc
abstract mixin class $PostRestrictionsCopyWith<$Res>  {
  factory $PostRestrictionsCopyWith(PostRestrictions value, $Res Function(PostRestrictions) _then) = _$PostRestrictionsCopyWithImpl;
@useResult
$Res call({
 bool? requireVerifiedAccount
});




}
/// @nodoc
class _$PostRestrictionsCopyWithImpl<$Res>
    implements $PostRestrictionsCopyWith<$Res> {
  _$PostRestrictionsCopyWithImpl(this._self, this._then);

  final PostRestrictions _self;
  final $Res Function(PostRestrictions) _then;

/// Create a copy of PostRestrictions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requireVerifiedAccount = freezed,}) {
  return _then(_self.copyWith(
requireVerifiedAccount: freezed == requireVerifiedAccount ? _self.requireVerifiedAccount : requireVerifiedAccount // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostRestrictions].
extension PostRestrictionsPatterns on PostRestrictions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostRestrictions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostRestrictions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostRestrictions value)  $default,){
final _that = this;
switch (_that) {
case _PostRestrictions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostRestrictions value)?  $default,){
final _that = this;
switch (_that) {
case _PostRestrictions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? requireVerifiedAccount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostRestrictions() when $default != null:
return $default(_that.requireVerifiedAccount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? requireVerifiedAccount)  $default,) {final _that = this;
switch (_that) {
case _PostRestrictions():
return $default(_that.requireVerifiedAccount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? requireVerifiedAccount)?  $default,) {final _that = this;
switch (_that) {
case _PostRestrictions() when $default != null:
return $default(_that.requireVerifiedAccount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostRestrictions implements PostRestrictions {
  const _PostRestrictions({required this.requireVerifiedAccount});
  factory _PostRestrictions.fromJson(Map<String, dynamic> json) => _$PostRestrictionsFromJson(json);

@override final  bool? requireVerifiedAccount;

/// Create a copy of PostRestrictions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostRestrictionsCopyWith<_PostRestrictions> get copyWith => __$PostRestrictionsCopyWithImpl<_PostRestrictions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostRestrictionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostRestrictions&&(identical(other.requireVerifiedAccount, requireVerifiedAccount) || other.requireVerifiedAccount == requireVerifiedAccount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requireVerifiedAccount);

@override
String toString() {
  return 'PostRestrictions(requireVerifiedAccount: $requireVerifiedAccount)';
}


}

/// @nodoc
abstract mixin class _$PostRestrictionsCopyWith<$Res> implements $PostRestrictionsCopyWith<$Res> {
  factory _$PostRestrictionsCopyWith(_PostRestrictions value, $Res Function(_PostRestrictions) _then) = __$PostRestrictionsCopyWithImpl;
@override @useResult
$Res call({
 bool? requireVerifiedAccount
});




}
/// @nodoc
class __$PostRestrictionsCopyWithImpl<$Res>
    implements _$PostRestrictionsCopyWith<$Res> {
  __$PostRestrictionsCopyWithImpl(this._self, this._then);

  final _PostRestrictions _self;
  final $Res Function(_PostRestrictions) _then;

/// Create a copy of PostRestrictions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requireVerifiedAccount = freezed,}) {
  return _then(_PostRestrictions(
requireVerifiedAccount: freezed == requireVerifiedAccount ? _self.requireVerifiedAccount : requireVerifiedAccount // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
