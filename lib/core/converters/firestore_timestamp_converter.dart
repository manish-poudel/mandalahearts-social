import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class FirestoreDateTimeConverter implements JsonConverter<DateTime, Object> {
  const FirestoreDateTimeConverter();

  @override
  DateTime fromJson(Object json) {
    if (json is Timestamp) {
      return json.toDate();
    }

    if (json is String) {
      return DateTime.parse(json);
    }

    throw Exception('Invalid DateTime format: $json');
  }

  @override
  Object toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}
