import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mandalahearts/core/widgets/photo/interactive_image_viewer.dart';
import 'package:mandalahearts/core/widgets/photo/media_picker.dart';
import 'package:mandalahearts/core/widgets/progress_dialog_box.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:go_router/go_router.dart';

class PhotoPickerScreen extends StatefulWidget {
  const PhotoPickerScreen({super.key});

  @override
  State<PhotoPickerScreen> createState() => _PhotoPickerScreenState();
}

class _PhotoPickerScreenState extends State<PhotoPickerScreen> {
  AssetEntity? selectedImage;
  ImageViewerController imageViewerController = ImageViewerController();

  void popWithImage(Uint8List? photo) {
    ProgressDialogBox.hide(context);
    context.pop(photo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Profle Picture"),
        actions: [
          TextButton(
            onPressed: selectedImage == null
                ? null
                : () async {
                    ProgressDialogBox.show(
                      context,
                      message: 'Processing image...',
                    );
                    final image = await imageViewerController
                        .captureImageBytes();
                    popWithImage(image);
                  },
            child: Text(
              "Done",
              style: TextStyle(
                color: selectedImage == null
                    ? Colors.grey
                    : Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: MediaPicker(
        viewerController: imageViewerController,
        shape: ImageViewerShape.circle,
        onImageSelected: (assetEntity) {
          setState(() {
            selectedImage = assetEntity;
          });
        },
      ),
    );
  }
}
