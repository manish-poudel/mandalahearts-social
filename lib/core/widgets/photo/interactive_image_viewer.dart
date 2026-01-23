import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

/// Controller to capture the full rectangular image
class ImageViewerController {
  _InteractiveImageViewerState? _state;

  Future<Uint8List?> captureImageBytes() async {
    if (_state == null) return null;
    return _state!.captureImageBytes();
  }
}

/// Shape hint options
enum ImageViewerShape { rectangle, circle }

class InteractiveImageViewer extends StatefulWidget {
  final AssetEntity image;
  final ImageViewerController? controller;
  final ImageViewerShape shape; // just visual hint

  const InteractiveImageViewer({
    super.key,
    required this.image,
    this.controller,
    this.shape = ImageViewerShape.rectangle,
  });

  @override
  State<InteractiveImageViewer> createState() => _InteractiveImageViewerState();
}

class _InteractiveImageViewerState extends State<InteractiveImageViewer> {
  final GlobalKey _previewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.controller?._state = this;
  }

  /// Capture the full rectangular image as bytes
  Future<Uint8List?> captureImageBytes() async {
    try {
      final boundary =
          _previewKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) return null;

      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint("Error capturing image bytes: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Full rectangular image
    Widget content = AssetEntityImage(
      widget.image,
      fit: BoxFit.cover,
      isOriginal: true,
      width: double.infinity,
      height: double.infinity,
    );

    // Wrap in zoomable InteractiveViewer
    content = InteractiveViewer(minScale: 1, maxScale: 5, child: content);

    // RepaintBoundary to capture full rectangle
    content = RepaintBoundary(key: _previewKey, child: content);

    // Add circular overlay hint
    if (widget.shape == ImageViewerShape.circle) {
      content = Stack(
        children: [
          Positioned.fill(child: content),
          IgnorePointer(
            child: CustomPaint(
              size: Size.infinite,
              painter: _CircleOverlayPainter(),
            ),
          ),
        ],
      );
    }

    // Bound inside square
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth; // square aspect
        return SizedBox(width: size, height: size, child: content);
      },
    );
  }
}

/// Painter for circular overlay (transparent inside, dark outside)
class _CircleOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withAlpha(120)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height)) // full rect
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height)) // circle
      ..fillType = PathFillType.evenOdd; // subtract circle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
