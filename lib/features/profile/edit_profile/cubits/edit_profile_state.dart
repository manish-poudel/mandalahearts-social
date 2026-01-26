// edit_profile_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.preparing({required AppUser user}) =
      _Preparing;

  const factory EditProfileState.loaded({
    required AppUser user,
    @Default(false) bool isSavingBasicDetails,
    @Default(false) bool isSavingProfileImage,
    @Default(false) bool basicDetailSaved,
  }) = _Loaded;

  const factory EditProfileState.error({required String message}) = _Error;
}
