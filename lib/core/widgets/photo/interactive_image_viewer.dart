import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

/// 🔹 Controller for InteractiveImageViewer to trigger capture
class ImageViewerController {
  _InteractiveImageViewerState? _state;

  /// Capture the currently displayed image as a file
  Future<Uint8List?> captureImageBytes() async {
    if (_state == null) return null;
    return _state!.captureImageBytes();
  }
}

/// 🔹 Interactive Image Viewer
class InteractiveImageViewer extends StatefulWidget {
  final AssetEntity image;
  final ImageViewerController? controller;

  const InteractiveImageViewer({
    super.key,
    required this.image,
    this.controller,
  });

  @override
  State<InteractiveImageViewer> createState() => _InteractiveImageViewerState();
}

class _InteractiveImageViewerState extends State<InteractiveImageViewer> {
  final GlobalKey _previewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.controller?._state = this; // link controller
  }

  /// Capture image in preview as bytes
  Future<Uint8List?> captureImageBytes() async {
    try {
      final boundary =
          _previewKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) return null;

      // Capture the widget as an image
      final image = await boundary.toImage(pixelRatio: 3);

      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final bytes = byteData!.buffer.asUint8List();
      return bytes;
    } catch (e) {
      debugPrint("Error capturing image bytes: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: RepaintBoundary(
        key: _previewKey,
        child: ClipRect(
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 5,
            child: AssetEntityImage(
              widget.image,
              fit: BoxFit.cover,
              isOriginal: true,
            ),
          ),
        ),
      ),
    );
  }
}
