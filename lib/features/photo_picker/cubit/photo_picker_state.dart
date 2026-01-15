import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'photo_picker_state.freezed.dart';

@freezed
abstract class PhotoPickerState with _$PhotoPickerState {
  const factory PhotoPickerState({
    @Default([]) List<AssetPathEntity> albums,
    AssetPathEntity? selectedAlbum,
    @Default([]) List<AssetEntity> images,
    AssetEntity? selectedImage,

    @Default(true) bool loading,
    @Default(false) bool loadingMore,
    @Default(false) bool limitedAccess,
    @Default(false) bool reachedEnd,
    @Default(false) bool permissionDenied,
  }) = _PhotoPickerState;
}
