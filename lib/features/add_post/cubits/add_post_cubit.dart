import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/services/compressor/image_compressor.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
import 'package:mandalahearts/features/add_post/cubits/add_post_state.dart';
import 'package:mandalahearts/models/async/async_state.dart';
import 'package:mandalahearts/repository/post_repository.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({required this.creatorId, required this.postRepository})
    : super(const AddPostState());

  final PostRepository postRepository;
  final String creatorId;

  void selectImage(AssetEntity image) {
    debugPrint("Image was selected");
    emit(state.copyWith(selectedImage: image));
  }

  void setLockScroll(bool value) {
    emit(state.copyWith(lockScroll: value));
  }

  Future<void> goToWritingStep(ImageViewerController controller) async {
    if (state.selectedImage == null) return;

    emit(state.copyWith(isProcessing: true));

    try {
      final Uint8List? bytes = await controller.captureImageBytes();
      if (bytes != null) {
        emit(state.copyWith(capturedBytes: bytes, currentStep: 1));
      }
    } finally {
      emit(state.copyWith(isProcessing: false));
    }
  }

  void goBackToPicker() {
    emit(state.copyWith(currentStep: 0));
  }

  Future<void> savePost(String caption) async {
    if (state.capturedBytes == null) return;

    if (caption.trim().isEmpty) {
      emit(
        state.copyWith(
          postState: const AsyncState.error(
            'Please write something before posting',
          ),
        ),
      );
      return;
    }

    emit(state.copyWith(postState: const AsyncState.loading()));

    final compressedBytes = await ImageCompressor.compress(
      state.capturedBytes!,
      quality: 60,
    );

    try {
      await postRepository.createPost(
        creatorId: creatorId,
        imageBytes: compressedBytes,
        caption: caption.trim(),
      );

      emit(state.copyWith(postState: const AsyncState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          postState: AsyncState.error("Something went wrong.Try again"),
        ),
      );
    }
  }
}
