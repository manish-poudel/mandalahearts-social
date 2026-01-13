import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/models/app_user/app_user.dart';
part 'profile_state.freezed.dart';

@freezed
abstract class ProfileDetailsState with _$ProfileDetailsState {
  const factory ProfileDetailsState.loading() = _Loading;
  const factory ProfileDetailsState.ready({AppUser? user}) = _Ready;

  const factory ProfileDetailsState.saving({AppUser? user}) = _Saving;

  const factory ProfileDetailsState.success({AppUser? user}) = _Success;

  const factory ProfileDetailsState.error({
    required String message,
    AppUser? user,
  }) = _Error;
}
