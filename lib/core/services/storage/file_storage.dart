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

  /// Deletes a file from the storage bucket
  ///
  /// Returns `true` if deleted successfully, `false` otherwise.
  Future<void> deleteFile({required String bucket, required String filePath});
}
