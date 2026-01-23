import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
import 'package:mandalahearts/core/widgets/photo/media_picker.dart';
import 'package:mandalahearts/core/widgets/progress_dialog_box.dart';
import 'package:mandalahearts/features/add_post/cubits/add_post_cubit.dart';
import 'package:mandalahearts/features/add_post/cubits/add_post_state.dart';
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
                            ? () => {debugPrint("no image selected")}
                            : () {
                                cubit.goToWritingStep(_viewerController);
                              })
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
                MediaPicker(
                  viewerController: _viewerController,
                  onImageSelected: (image) {
                    if (image != null) {
                      cubit.selectImage(image);
                    }
                  },
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
                          autofocus: true,
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
