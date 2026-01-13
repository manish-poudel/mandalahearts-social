import 'package:freezed_annotation/freezed_annotation.dart';
part 'username_state.freezed.dart';

@freezed
class UsernameState with _$UsernameState {
  const factory UsernameState.initial() = _Initial;
  const factory UsernameState.loading() = _Loading;
  const factory UsernameState.success() = _Success;
  const factory UsernameState.error({required String message}) = _Error;
}
