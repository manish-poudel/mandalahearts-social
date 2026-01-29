import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/enums/profile_mode.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
part 'profile_view_state.freezed.dart';

@freezed
abstract class ProfileViewState with _$ProfileViewState {
  const factory ProfileViewState.loading() = _Loading;
  const factory ProfileViewState.loaded({
    required AppUser user,
    required ProfileMode mode,
    @Default(true) isAccountVerfied,
  }) = _Loaded;
  const factory ProfileViewState.error(String message) = _Error;
}
