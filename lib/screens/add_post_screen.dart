import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/photo/image_picker_grid.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
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

  int _currentStep = 0;
  bool _isProcessing = false;
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
          _currentStep = 1; // go to writing step
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
      // Upload bytes + caption to Firebase/Supabase
      print(
        "Uploading image with ${_capturedBytes!.length} bytes and caption: $caption",
      );
    }
  }

  @override
  void dispose() {
    _captionController.dispose();
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
                  setState(() {
                    _currentStep = 0; // back to image selection
                  });
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
          // Step 0 → Image Selection
          Stack(
            children: [
              Column(
                children: [
                  if (selectedImage != null)
                    InteractiveImageViewer(
                      image: selectedImage!,
                      controller: _viewerController,
                    ),
                  Expanded(
                    child: PhotoPickerGrid(
                      onImageSelected: (image) {
                        setState(() {
                          selectedImage = image;
                        });
                      },
                    ),
                  ),
                ],
              ),
              if (_isProcessing)
                Container(
                  color: Colors.black54,
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 12),
                        Text(
                          "Processing image...",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          // Step 1 → Writing Post
          SingleChildScrollView(
            child: Column(
              children: [
                if (_capturedBytes != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.memory(_capturedBytes!, height: 160),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _captionController,
                    decoration: const InputDecoration(
                      labelText: 'Write a caption...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
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
