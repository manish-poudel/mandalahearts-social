import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@Freezed(toJson: true)
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String username,
    BasicDetails? basicDetails,
    String? bio,
    SpiritualDetails? spiritualDetails,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

@freezed
abstract class BasicDetails with _$BasicDetails {
  const factory BasicDetails({
    required String firstName,
    required String secondName,
    required DateTime dob,
    required String country,
    String? profilePictureUrl,
  }) = _BasicDetails;

  factory BasicDetails.fromJson(Map<String, dynamic> json) =>
      _$BasicDetailsFromJson(json);
}

@freezed
abstract class SpiritualDetails with _$SpiritualDetails {
  const factory SpiritualDetails({
    String? guruName,
    String? spiritualOrganisation,
    String? spiritualPractice,
  }) = _SpiritualDetails;

  factory SpiritualDetails.fromJson(Map<String, dynamic> json) =>
      _$SpiritualDetailsFromJson(json);
}
