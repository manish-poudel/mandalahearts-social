import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCompressor {
  static Future<Uint8List> compress(
    Uint8List bytes, {
    int quality = 85,
    int minWidth = 1080,
    int minHeight = 1080,
  }) async {
    final compressed = await FlutterImageCompress.compressWithList(
      bytes,
      quality: quality,
      minWidth: minWidth,
      minHeight: minHeight,
      format: CompressFormat.png,
    );

    return Uint8List.fromList(compressed);
  }
}
