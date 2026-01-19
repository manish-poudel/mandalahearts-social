import 'dart:typed_data';

abstract class FileStorage {
  Future<void> uploadImage({
    required String bucket,
    required String filePath,
    required Uint8List bytes,
    required String contentType,
  });

  Future<String> createSignedUrl({
    required String bucket,
    required String filePath,
    required int expiresInSeconds,
  });
}
