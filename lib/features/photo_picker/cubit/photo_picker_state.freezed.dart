// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhotoPickerState {

 List<AssetPathEntity> get albums; AssetPathEntity? get selectedAlbum; List<AssetEntity> get images; AssetEntity? get selectedImage; bool get loading; bool get loadingMore; bool get limitedAccess; bool get reachedEnd; bool get permissionDenied;
/// Create a copy of PhotoPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoPickerStateCopyWith<PhotoPickerState> get copyWith => _$PhotoPickerStateCopyWithImpl<PhotoPickerState>(this as PhotoPickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoPickerState&&const DeepCollectionEquality().equals(other.albums, albums)&&(identical(other.selectedAlbum, selectedAlbum) || other.selectedAlbum == selectedAlbum)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&(identical(other.limitedAccess, limitedAccess) || other.limitedAccess == limitedAccess)&&(identical(other.reachedEnd, reachedEnd) || other.reachedEnd == reachedEnd)&&(identical(other.permissionDenied, permissionDenied) || other.permissionDenied == permissionDenied));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(albums),selectedAlbum,const DeepCollectionEquality().hash(images),selectedImage,loading,loadingMore,limitedAccess,reachedEnd,permissionDenied);

@override
String toString() {
  return 'PhotoPickerState(albums: $albums, selectedAlbum: $selectedAlbum, images: $images, selectedImage: $selectedImage, loading: $loading, loadingMore: $loadingMore, limitedAccess: $limitedAccess, reachedEnd: $reachedEnd, permissionDenied: $permissionDenied)';
}


}

/// @nodoc
abstract mixin class $PhotoPickerStateCopyWith<$Res>  {
  factory $PhotoPickerStateCopyWith(PhotoPickerState value, $Res Function(PhotoPickerState) _then) = _$PhotoPickerStateCopyWithImpl;
@useResult
$Res call({
 List<AssetPathEntity> albums, AssetPathEntity? selectedAlbum, List<AssetEntity> images, AssetEntity? selectedImage, bool loading, bool loadingMore, bool limitedAccess, bool reachedEnd, bool permissionDenied
});




}
/// @nodoc
class _$PhotoPickerStateCopyWithImpl<$Res>
    implements $PhotoPickerStateCopyWith<$Res> {
  _$PhotoPickerStateCopyWithImpl(this._self, this._then);

  final PhotoPickerState _self;
  final $Res Function(PhotoPickerState) _then;

/// Create a copy of PhotoPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? albums = null,Object? selectedAlbum = freezed,Object? images = null,Object? selectedImage = freezed,Object? loading = null,Object? loadingMore = null,Object? limitedAccess = null,Object? reachedEnd = null,Object? permissionDenied = null,}) {
  return _then(_self.copyWith(
albums: null == albums ? _self.albums : albums // ignore: cast_nullable_to_non_nullable
as List<AssetPathEntity>,selectedAlbum: freezed == selectedAlbum ? _self.selectedAlbum : selectedAlbum // ignore: cast_nullable_to_non_nullable
as AssetPathEntity?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as AssetEntity?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,limitedAccess: null == limitedAccess ? _self.limitedAccess : limitedAccess // ignore: cast_nullable_to_non_nullable
as bool,reachedEnd: null == reachedEnd ? _self.reachedEnd : reachedEnd // ignore: cast_nullable_to_non_nullable
as bool,permissionDenied: null == permissionDenied ? _self.permissionDenied : permissionDenied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoPickerState].
extension PhotoPickerStatePatterns on PhotoPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoPickerState value)  $default,){
final _that = this;
switch (_that) {
case _PhotoPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AssetPathEntity> albums,  AssetPathEntity? selectedAlbum,  List<AssetEntity> images,  AssetEntity? selectedImage,  bool loading,  bool loadingMore,  bool limitedAccess,  bool reachedEnd,  bool permissionDenied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoPickerState() when $default != null:
return $default(_that.albums,_that.selectedAlbum,_that.images,_that.selectedImage,_that.loading,_that.loadingMore,_that.limitedAccess,_that.reachedEnd,_that.permissionDenied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AssetPathEntity> albums,  AssetPathEntity? selectedAlbum,  List<AssetEntity> images,  AssetEntity? selectedImage,  bool loading,  bool loadingMore,  bool limitedAccess,  bool reachedEnd,  bool permissionDenied)  $default,) {final _that = this;
switch (_that) {
case _PhotoPickerState():
return $default(_that.albums,_that.selectedAlbum,_that.images,_that.selectedImage,_that.loading,_that.loadingMore,_that.limitedAccess,_that.reachedEnd,_that.permissionDenied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AssetPathEntity> albums,  AssetPathEntity? selectedAlbum,  List<AssetEntity> images,  AssetEntity? selectedImage,  bool loading,  bool loadingMore,  bool limitedAccess,  bool reachedEnd,  bool permissionDenied)?  $default,) {final _that = this;
switch (_that) {
case _PhotoPickerState() when $default != null:
return $default(_that.albums,_that.selectedAlbum,_that.images,_that.selectedImage,_that.loading,_that.loadingMore,_that.limitedAccess,_that.reachedEnd,_that.permissionDenied);case _:
  return null;

}
}

}

/// @nodoc


class _PhotoPickerState implements PhotoPickerState {
  const _PhotoPickerState({final  List<AssetPathEntity> albums = const [], this.selectedAlbum, final  List<AssetEntity> images = const [], this.selectedImage, this.loading = true, this.loadingMore = false, this.limitedAccess = false, this.reachedEnd = false, this.permissionDenied = false}): _albums = albums,_images = images;
  

 final  List<AssetPathEntity> _albums;
@override@JsonKey() List<AssetPathEntity> get albums {
  if (_albums is EqualUnmodifiableListView) return _albums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_albums);
}

@override final  AssetPathEntity? selectedAlbum;
 final  List<AssetEntity> _images;
@override@JsonKey() List<AssetEntity> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  AssetEntity? selectedImage;
@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool loadingMore;
@override@JsonKey() final  bool limitedAccess;
@override@JsonKey() final  bool reachedEnd;
@override@JsonKey() final  bool permissionDenied;

/// Create a copy of PhotoPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoPickerStateCopyWith<_PhotoPickerState> get copyWith => __$PhotoPickerStateCopyWithImpl<_PhotoPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoPickerState&&const DeepCollectionEquality().equals(other._albums, _albums)&&(identical(other.selectedAlbum, selectedAlbum) || other.selectedAlbum == selectedAlbum)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&(identical(other.limitedAccess, limitedAccess) || other.limitedAccess == limitedAccess)&&(identical(other.reachedEnd, reachedEnd) || other.reachedEnd == reachedEnd)&&(identical(other.permissionDenied, permissionDenied) || other.permissionDenied == permissionDenied));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_albums),selectedAlbum,const DeepCollectionEquality().hash(_images),selectedImage,loading,loadingMore,limitedAccess,reachedEnd,permissionDenied);

@override
String toString() {
  return 'PhotoPickerState(albums: $albums, selectedAlbum: $selectedAlbum, images: $images, selectedImage: $selectedImage, loading: $loading, loadingMore: $loadingMore, limitedAccess: $limitedAccess, reachedEnd: $reachedEnd, permissionDenied: $permissionDenied)';
}


}

/// @nodoc
abstract mixin class _$PhotoPickerStateCopyWith<$Res> implements $PhotoPickerStateCopyWith<$Res> {
  factory _$PhotoPickerStateCopyWith(_PhotoPickerState value, $Res Function(_PhotoPickerState) _then) = __$PhotoPickerStateCopyWithImpl;
@override @useResult
$Res call({
 List<AssetPathEntity> albums, AssetPathEntity? selectedAlbum, List<AssetEntity> images, AssetEntity? selectedImage, bool loading, bool loadingMore, bool limitedAccess, bool reachedEnd, bool permissionDenied
});




}
/// @nodoc
class __$PhotoPickerStateCopyWithImpl<$Res>
    implements _$PhotoPickerStateCopyWith<$Res> {
  __$PhotoPickerStateCopyWithImpl(this._self, this._then);

  final _PhotoPickerState _self;
  final $Res Function(_PhotoPickerState) _then;

/// Create a copy of PhotoPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? albums = null,Object? selectedAlbum = freezed,Object? images = null,Object? selectedImage = freezed,Object? loading = null,Object? loadingMore = null,Object? limitedAccess = null,Object? reachedEnd = null,Object? permissionDenied = null,}) {
  return _then(_PhotoPickerState(
albums: null == albums ? _self._albums : albums // ignore: cast_nullable_to_non_nullable
as List<AssetPathEntity>,selectedAlbum: freezed == selectedAlbum ? _self.selectedAlbum : selectedAlbum // ignore: cast_nullable_to_non_nullable
as AssetPathEntity?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<AssetEntity>,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as AssetEntity?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,limitedAccess: null == limitedAccess ? _self.limitedAccess : limitedAccess // ignore: cast_nullable_to_non_nullable
as bool,reachedEnd: null == reachedEnd ? _self.reachedEnd : reachedEnd // ignore: cast_nullable_to_non_nullable
as bool,permissionDenied: null == permissionDenied ? _self.permissionDenied : permissionDenied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
