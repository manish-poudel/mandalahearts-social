import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String username,
    required String firstName,
    required String secondName,
    required DateTime dob,
    required String gender,
    required String? bio,
    required String? guruName,
    required String? spiritualOrganisation,
    required String? spiritualPractice,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
