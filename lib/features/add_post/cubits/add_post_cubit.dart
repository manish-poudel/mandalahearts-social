import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
import 'package:mandalahearts/features/add_post/cubits/add_post_state.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit()
    : super(const AddPostState(currentStep: 0, isProcessing: false));

  void selectImage(AssetEntity image) {
    emit(state.copyWith(selectedImage: image));
  }

  void setLockScroll(bool value) {
    emit(state.copyWith(lockScroll: value));
  }

  Future<void> goToWritingStep(
    ImageViewerController controller,
    Function onFinished,
  ) async {
    if (state.selectedImage == null) return;

    emit(state.copyWith(isProcessing: true));

    try {
      final Uint8List? bytes = await controller.captureImageBytes();
      if (bytes != null) {
        emit(state.copyWith(capturedBytes: bytes, currentStep: 1));
      }
    } finally {
      onFinished();
      emit(state.copyWith(isProcessing: false));
    }
  }

  void goBackToPicker() {
    emit(state.copyWith(currentStep: 0));
  }
}
