import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mandalahearts/features/app_lifecycle/enums/user_profile_state.dart';

part 'app_lifecycle_state.freezed.dart';

@freezed
class AppLifeCycleState with _$AppLifeCycleState {
  const factory AppLifeCycleState.initial() = _Initial;
  const factory AppLifeCycleState.loading() = _Loading;
  const factory AppLifeCycleState.forceUpdate({
    @Default("") String message,
    @Default("") String link,
  }) = _ForceUpdate;
  const factory AppLifeCycleState.authenticated({
    required UserProfileState profileState,
  }) = _Authenticated;
  const factory AppLifeCycleState.unauthenticated() = _Unauthenticated;
}
