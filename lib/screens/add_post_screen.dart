import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/photo/image_picker_grid.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
import 'package:mandalahearts/core/widgets/progress_dialog_box.dart';
import 'package:mandalahearts/features/add_post/cubits/add_post_cubit.dart';
import 'package:mandalahearts/features/add_post/cubits/add_post_state.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_cubit.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_state.dart';
import 'package:mandalahearts/models/async/async_state.dart';
import 'package:mandalahearts/repository/auth_repository.dart';
import 'package:mandalahearts/repository/post_repository.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final ImageViewerController _viewerController = ImageViewerController();
  final TextEditingController _captionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<PhotoPickerCubit>().loadMoreImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => AddPostCubit(
        postRepository: context.read<PostRepository>(),
        creatorId: context.read<AuthRepository>().currentUser!.uid,
      ),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {
          if (state.isProcessing) {
            ProgressDialogBox.show(context, message: 'Processing image...');
          } else {
            ProgressDialogBox.hide(context);
          }

          state.postState.whenOrNull(
            loading: () {
              ProgressDialogBox.show(context, message: 'Saving post...');
            },
            success: () {
              ProgressDialogBox.hide(context);
              Navigator.of(context).pop();
            },
            error: (message) {
              ProgressDialogBox.hide(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<AddPostCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('New Post'),
              leading: state.currentStep == 1
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: cubit.goBackToPicker,
                    )
                  : null,
              actions: [
                TextButton(
                  onPressed: state.currentStep == 0
                      ? (state.selectedImage == null || state.isProcessing
                            ? null
                            : () => cubit.goToWritingStep(_viewerController))
                      : () {
                          cubit.savePost(_captionController.text.trim());
                          debugPrint(
                            "Upload ${state.capturedBytes?.length} bytes "
                            "Caption: ${_captionController.text}",
                          );
                        },
                  child: Text(
                    state.currentStep == 0 ? 'Next' : 'Post',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: state.currentStep == 0
                          ? (state.selectedImage == null || state.isProcessing
                                ? colorScheme.onSurface.withAlpha(120)
                                : colorScheme.primary)
                          : colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: state.currentStep,
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  physics: state.lockScroll
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      if (state.selectedImage != null)
                        Listener(
                          onPointerDown: (_) => cubit.setLockScroll(true),
                          onPointerUp: (_) => cubit.setLockScroll(false),
                          onPointerCancel: (_) => cubit.setLockScroll(false),
                          child: InteractiveImageViewer(
                            image: state.selectedImage!,
                            controller: _viewerController,
                          ),
                        ),
                      BlocConsumer<PhotoPickerCubit, PhotoPickerState>(
                        listener: (context, pickerState) {
                          if (pickerState.selectedImage != null) {
                            cubit.selectImage(pickerState.selectedImage!);
                          }
                        },
                        builder: (_, _) => PhotoPickerGrid(
                          onImageSelected: (_) {
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state.capturedBytes != null)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.memory(
                            state.capturedBytes!,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          controller: _captionController,
                          minLines: 4,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Write a caption...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
