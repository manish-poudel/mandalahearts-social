import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandalahearts/core/widgets/photo/image_picker_grid.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_cubit.dart';
import 'package:mandalahearts/features/photo_picker/cubit/photo_picker_state.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  AssetEntity? selectedImage;

  final ImageViewerController _viewerController = ImageViewerController();
  final TextEditingController _captionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  int _currentStep = 0;
  bool _isProcessing = false;
  bool _lockScroll = false;
  Uint8List? _capturedBytes;

  /// Capture image bytes and go to writing step
  Future<void> _goToWritingStep() async {
    if (selectedImage == null) return;

    setState(() => _isProcessing = true);
    try {
      final bytes = await _viewerController.captureImageBytes();
      if (bytes != null) {
        setState(() {
          _capturedBytes = bytes;
          _currentStep = 1;
        });
      }
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  /// Submit post (upload image + caption)
  Future<void> _submitPost() async {
    final caption = _captionController.text;

    if (_capturedBytes != null) {
      debugPrint(
        "Uploading image with ${_capturedBytes!.length} bytes and caption: $caption",
      );
    }
  }

  void _onImageSelected(AssetEntity image) {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    setState(() {
      selectedImage = image;
    });
  }

  @override
  void dispose() {
    _captionController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        leading: _currentStep == 1
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() => _currentStep = 0);
                },
              )
            : null,
        actions: [
          TextButton(
            onPressed: _currentStep == 0
                ? (selectedImage == null || _isProcessing
                      ? null
                      : _goToWritingStep)
                : _submitPost,
            child: Text(
              _currentStep == 0 ? 'Next' : 'Post',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: _currentStep == 0
                    ? (selectedImage == null || _isProcessing
                          ? colorScheme.onSurface.withAlpha(120)
                          : colorScheme.primary)
                    : colorScheme.primary,
              ),
            ),
          ),
        ],
      ),

      body: IndexedStack(
        index: _currentStep,
        children: [
          // ======================
          // STEP 0: PICK IMAGE
          // ======================
          SingleChildScrollView(
            controller: _scrollController,
            physics: _lockScroll
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            child: Column(
              children: [
                if (selectedImage != null)
                  Listener(
                    onPointerDown: (_) {
                      setState(() => _lockScroll = true);
                    },
                    onPointerUp: (_) {
                      setState(() => _lockScroll = false);
                    },
                    onPointerCancel: (_) {
                      setState(() => _lockScroll = false);
                    },
                    child: InteractiveImageViewer(
                      image: selectedImage!,
                      controller: _viewerController,
                    ),
                  ),

                BlocProvider(
                  create: (_) => PhotoPickerCubit(),
                  child: BlocConsumer<PhotoPickerCubit, PhotoPickerState>(
                    builder: (context, state) {
                      return PhotoPickerGrid();
                    },
                    listener: (context, state) {
                      if (state.selectedImage != null) {
                        _onImageSelected(state.selectedImage!);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          // ======================
          // STEP 1: WRITE POST
          // ======================
          SingleChildScrollView(
            child: Column(
              children: [
                if (_capturedBytes != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.memory(
                      _capturedBytes!,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _captionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Write a caption...',
                      border: InputBorder.none, // ❌ remove underline
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4, // 👈 nicer paragraph spacing
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
