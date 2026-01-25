import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mandalahearts/core/services/storage/file_storage.dart';

class SupabaseFileStorage implements FileStorage {
  SupabaseFileStorage(this._client);

  final SupabaseClient _client;

  @override
  Future<void> uploadImage({
    required String bucket,
    required String filePath,
    required Uint8List bytes,
    required String contentType,
  }) async {
    await _client.storage
        .from(bucket)
        .uploadBinary(
          filePath,
          bytes,
          fileOptions: FileOptions(contentType: contentType, upsert: true),
        );
  }

  @override
  Future<String> createSignedUrl({
    required String bucket,
    required String filePath,
    required int expiresInSeconds,
  }) async {
    final response = await _client.storage
        .from(bucket)
        .createSignedUrl(filePath, expiresInSeconds);
    return response;
  }

  /// Deletes a file from Supabase storage
  ///
  /// Returns `true` if deleted successfully, `false` otherwise.
  @override
  Future<void> deleteFile({
    required String bucket,
    required String filePath,
  }) async {
    await _client.storage.from(bucket).remove([filePath]);
  }
}
