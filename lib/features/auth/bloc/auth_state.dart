import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/features/auth/enums/user_profile_state.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated({
    required UserProfileState profileState,
  }) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
