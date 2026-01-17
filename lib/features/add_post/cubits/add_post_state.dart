import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'add_post_state.freezed.dart';

@freezed
abstract class AddPostState with _$AddPostState {
  const factory AddPostState({
    AssetEntity? selectedImage,
    Uint8List? capturedBytes,

    @Default(0) int currentStep,
    @Default(false) bool isProcessing,
    @Default(false) bool lockScroll,
  }) = _AddPostState;
}
